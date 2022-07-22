module City
  # Constants
  @@METRO_SQL_ORIGIN_PREFIX = "with o_states_and_pumas as (
                   select distinct fips_state_code, migpuma10
                   from msa_delineation_2018, census_puma_relation,
                        crosswalk_2000_2010, puma_to_powpuma_relation
                   where CSA_Code = ? and
                         st = fips_state_code and
                         county = fips_county_code and
                         migpuma10 = pw_puma00_migpuma1 and
                         puma = puma_5ce),"

  @@METRO_SQL_DEST_PREFIX = "
                   d_states_and_pumas as (
                     select distinct fips_state_code, migpuma10
                     from msa_delineation_2018, census_puma_relation,
                          crosswalk_2000_2010, puma_to_powpuma_relation
                     where CSA_Code = ? and
                           st = fips_state_code and
                           county = fips_county_code and
                           migpuma10 = pw_puma00_migpuma1 and
                           puma = puma_5ce)"

 @@CITY_SQL_ORIGIN_PREFIX = "
   with o_states_and_pumas as (
                   select distinct fips_state_code, migpuma10
                   from msa_delineation_2018, census_puma_relation,
                        crosswalk_2000_2010, puma_to_powpuma_relation
                   where cbsa_title = ? and
                         st = fips_state_code and
                         county = fips_county_code and
                         migpuma10 = pw_puma00_migpuma1 and
                         puma = puma_5ce),"

 @@CITY_TOP_K_OUTFLOW_PREFIX = "
     -- mig_o_states_and_pumas necessary due to issue of 2000 vs. 2010
     -- representation of puma codes
     mig_o_states_and_pumas as (
                   select distinct state_o,
                                   puma_to_powpuma_relation.puma
                   from df1, puma_to_powpuma_relation
                   where (state_o, migpuma_o) in
                         (select * from o_states_and_pumas) and
                         migpuma_o = pw_puma00_migpuma1     and
                         state_o   = res_state)"

 @@CITY_SQL_DEST_PREFIX = "
                   d_states_and_pumas as (
                     select distinct fips_state_code, migpuma10
                     from msa_delineation_2018, census_puma_relation,
                          crosswalk_2000_2010, puma_to_powpuma_relation
                     where cbsa_title = ? and
                           st = fips_state_code and
                           county = fips_county_code and
                           migpuma10 = pw_puma00_migpuma1 and
                           puma = puma_5ce)"

 @@CITY_SQL_SUFFIX =  " select substr(serial_no, 1, 4) as year, age, person_number,
                        person_weight, state::text as destination_state,
                        state_o::text as original_state,
                        puma_to_powpuma_relation.puma as original_puma,
                        df1.puma::int as destination_puma
                 from df1, puma_to_powpuma_relation
                 where (state_o, migpuma_o) in
                       (select * from o_states_and_pumas) and
                       (state, migpuma_d) in
                       (select * from d_states_and_pumas) and
                       migpuma_o = pw_puma00_migpuma1     and
                       state_o   = res_state"

  @@CITY_TOP_K_OUTFLOW_SUFFIX = "
  select sum(person_weight) as population,
         min(state_o)::text as original_state,
         min(puma_to_powpuma_relation.puma)::int as original_puma,
         state::text as destination_state,
         df1.puma::int as destination_puma
   from df1, puma_to_powpuma_relation
   where (state_o, migpuma_o) in (select * from o_states_and_pumas)  and
         (state::int, df1.puma::int) not in (select * from mig_o_states_and_pumas) and
         migpuma_o = pw_puma00_migpuma1                              and
         state_o   = res_state                                       and
         substr(serial_no, 1, 4)::int between ? and ?
   group by destination_puma, destination_state
   order by sum(person_weight) desc
   limit ?;"

  @@CITY_SQL_YEAR_CLAUSE = " and substr(serial_no, 1, 4)::int between ? and ? "

  @@CITY_SQL_K_OUTFLOWS = "limit ?;"

  def is_number? string
    true if Integer(string) rescue false
  end


  def get_proper_sql_arr(o_city, d_city, k, start_year, end_year)
    # if the user supplied an o_city and not a d_city then we need to select
    # the top k outflows
    #
    # top k outflows from o_city
    if !o_city.nil? and d_city.nil?
      o_city_name_or_code = Df1Original.city_name_to_CSA(o_city)
      o_city_prefix = is_number?(o_city_name_or_code) ?
                      @@METRO_SQL_ORIGIN_PREFIX : @@CITY_SQL_ORIGIN_PREFIX
      mig_o_city_prefix = @@CITY_TOP_K_OUTFLOW_PREFIX
      suffix = @@CITY_TOP_K_OUTFLOW_SUFFIX
      [o_city_prefix + mig_o_city_prefix + suffix,
       o_city_name_or_code, start_year.to_i,
       end_year.to_i, k.to_i]

    # top k inflows from d_city is invalid as information from database cannot
    # be extrapolated
    elsif o_city.nil? and !d_city.nil?
      STDERR.puts("Non-nil d_city provided with nil o_city. Top k inflows " +
                  "are not supported by application and should be prevented " +
                  "from requesting on the front end")
    # o_city->d_city flows
    else
      o_city_name_or_code = Df1Original.city_name_to_CSA(o_city)
      d_city_name_or_code = Df1Original.city_name_to_CSA(d_city)
      o_city_prefix = is_number?(o_city_name_or_code) ?
                      @@METRO_SQL_ORIGIN_PREFIX : @@CITY_SQL_ORIGIN_PREFIX
      d_city_prefix = is_number?(d_city_name_or_code) ?
                      @@METRO_SQL_DEST_PREFIX : @@CITY_SQL_DEST_PREFIX
      suffix = @@CITY_SQL_SUFFIX + @@CITY_SQL_YEAR_CLAUSE +
               @@CITY_SQL_K_OUTFLOWS
      [o_city_prefix + d_city_prefix + suffix, o_city_name_or_code,
       d_city_name_or_code, start_year.to_i, end_year.to_i, k.to_i]
    end
  end
end

class Df1OriginalsController < ApplicationController
  before_action :set_df1_original, only: %i[ show edit update destroy ]
  include City

  @@session_results = []

  # GET /df1_originals, /df1_originals.json, or /df1_originals.csv
  def index
    # TODO: Debug commented code below for allowing dynamic database information
    # puts ActiveRecord::Base.connection_db_config.as_json
    # get_pass = -> {pass = STDIN.noecho(&:gets).chop
		   # pass == "nil"? nil : pass}
    # Attempt to change connection dynamically
    # ActiveRecord::Base.establish_connection(
     #  "adapter"  => "postgresql",
     #  "encoding" => "unicode",
     #  "username" => (puts "Enter username: "; gets.chop),
     #  "password" => (puts "Enter password: ('nil' for no password)"; get_pass.call()),
     #  "database" => (puts "Enter database: "; gets.chop),
     #  "host"     => "localhost",
     #  "port"     => 5432
    # )
    @query = params
    if params[:o_city] and params[:k] and params[:start_year] and
       params[:end_year]
      clean_sql =
        ActiveRecord::Base::sanitize_sql_array(
          get_proper_sql_arr(params[:o_city], params[:d_city], params[:k],
                             params[:start_year], params[:end_year]))
      record_results = ActiveRecord::Base.connection.execute(clean_sql)

      @df1_originals = record_results
      @@session_results.append(record_results)
      @@session_results.each do |res|
        puts(res.class)
        puts(res.as_json)
      end
    # Reset connections on refresh
    elsif request.format == 'text/html'
      @@session_results = []
      @df1_originals = [nil]
    end
    @all_cities = Df1Original.get_all_cities
    @years = Df1Original.get_years

    # Lambda function to process csv based on attributes of SQL results
    to_csv = -> (records) {
      CSV.generate(headers: true) do |csv|
        if records.first.is_a? Hash
          attributes = records.first.keys
          csv << attributes

          records.each do |row|
            csv << row.values_at(*attributes)
          end
        # Should be default case, array of ActiveRecords
        elsif records.first.class == PG::Result
          attributes = records.first.first.keys
          csv << attributes
          records.each do |record|
            record.each do |row|
              csv << row.values_at(*attributes)
            end
          end
        else
          attributes = records.first.attributes.keys
          csv << attributes

          records.each do |row|
            csv << row.attributes.values_at(*attributes)
          end
        end
      end
    }
    respond_to do |format|
      format.html
      format.csv { send_data to_csv.call(@@session_results),
                             :filename =>
                             (@query.key?(:o_city) and
                              @query.key?(:d_city) ?
                              'from-' +
                              @query[:o_city].tr(' ', '_') +
                              '-to-' +
                              @query[:d_city].tr(' ', '_') +
                              (@query[:year].empty? ? '' :
                                                      '-' + @query[:year]) +
                              '.csv' :
                              'df1_originals.csv')
      }
      format.json { render json: @df1_originals }
    end
  end

  # GET /df1_originals/1 or /df1_originals/1.json
  def show
  end

  # GET /df1_originals/new
  def new
    @df1_original = Df1Original.new
  end

  # GET /df1_originals/1/edit
  def edit
  end

  # POST /df1_originals or /df1_originals.json
  def create
    @df1_original = Df1Original.new(df1_original_params)

    respond_to do |format|
      if @df1_original.save
        format.html { redirect_to df1_original_url(@df1_original),
                                  notice:
                                    "Df1 original was successfully created." }
        format.json { render :show, status: :created, location: @df1_original }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @df1_original.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /df1_originals/1 or /df1_originals/1.json
  def update
    respond_to do |format|
      if @df1_original.update(df1_original_params)
        format.html { redirect_to df1_original_url(@df1_original),
                                  notice:
                                    "Df1 original was successfully updated." }
        format.json { render :show, status: :ok, location: @df1_original }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @df1_original.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /df1_originals/1 or /df1_originals/1.json
  def destroy
    @df1_original.destroy

    respond_to do |format|
      format.html { redirect_to df1_originals_url,
                                notice:
                                  "Df1 original was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_df1_original
      @df1_original = Df1Original.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def df1_original_params
      params.require(:df1_original).permit(:record_type, :serial_no, :city,
                                           :year)
    end
end
