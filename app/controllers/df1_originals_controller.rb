class Df1OriginalsController < ApplicationController
  before_action :set_df1_original, only: %i[ show edit update destroy ]

  # Constants
  # @@METRO_SQL = "with o_states_and_pumas as (
  #                  select distinct fips_state_code, pw_puma00_migpuma1
  #                  from msa_delineation_2018, census_puma_relation,
  #                       puma_to_powpuma_relation
  #                  where CSA_Code = ? and
  #                        st = fips_state_code and
  #                        county = fips_county_code and
  #                        puma_to_powpuma_relation.puma = puma_5ce),
  #                  d_states_and_pumas as (
  #                    select distinct fips_state_code, pw_puma00_migpuma1
  #                    from msa_delineation_2018, census_puma_relation,
  #                         puma_to_powpuma_relation
  #                    where CSA_Code = ? and
  #                          st = fips_state_code and
  #                          county = fips_county_code and
  #                          puma_to_powpuma_relation.puma = puma_5ce)

  #                select substr(serial_no, 1, 4) as year, age, person_number,
  #                       person_weight, state as destination_state,
  #                       state_o as original_state, migpuma_o as original_puma,
  #                       migpuma_d as destination_puma
  #                from df1
  #                where (state_o, migpuma_o) in
  #                      (select * from o_states_and_pumas) and
  #                      (state, migpuma_d) in
  #                      (select * from d_states_and_pumas);"
  @@METRO_SQL = "with o_states_and_pumas as (
                   select distinct fips_state_code, migpuma10
                   from msa_delineation_2018, census_puma_relation,
                        crosswalk_2000_2010, puma_to_powpuma_relation
                   where CSA_Code = ? and
                         st = fips_state_code and
                         county = fips_county_code and
                         migpuma10 = pw_puma00_migpuma1 and
                         puma = puma_5ce),
                   d_states_and_pumas as (
                     select distinct fips_state_code, migpuma10
                     from msa_delineation_2018, census_puma_relation,
                          crosswalk_2000_2010, puma_to_powpuma_relation
                     where CSA_Code = ? and
                           st = fips_state_code and
                           county = fips_county_code and
                           migpuma10 = pw_puma00_migpuma1 and
                           puma = puma_5ce)

                 select substr(serial_no, 1, 4) as year, age, person_number,
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
                       state_o   = res_state;"

  # GET /df1_originals or /df1_originals.json
  def index
    @query = params
    if params[:o_city] and params[:d_city]
      clean_sql =
        ActiveRecord::Base::sanitize_sql_array([@@METRO_SQL,
                                                Df1Original.metro_name_to_CSA(
                                                  params[:o_city]),
                                                Df1Original.metro_name_to_CSA(
                                                  params[:d_city])])
      record_results = ActiveRecord::Base.connection.execute(clean_sql)

      @df1_originals = record_results
    else
      # Get only three element so computer doesn't crash
      @df1_originals = Df1Original.take(3)
    end
    @metro = Df1Original.get_top_10_metro

    # Lambda function to process csv based on attributes of SQL results
    to_csv = -> (records) {
      CSV.generate(headers: true) do |csv|
        if records.first.is_a? Hash
          attributes = records.first.keys
          csv << attributes

          records.each do |row|
            csv << row.values_at(*attributes)
          end
        else
          attributes = records.first.attributes.keys
          csv << attributes

          records.each do |row|
            puts row.attributes.values_at(*attributes)
            csv << row.attributes.values_at(*attributes)
          end
        end
      end
    }
    respond_to do |format|
      format.html
      format.csv { send_data to_csv.call(@df1_originals),
                             :filename =>
                             (@query.key?(:o_city) and
                             @query.key?(:d_city) ?
                             'from-' +
                             @query[:o_city].tr(' ', '_') +
                             '-to-' +
                             @query[:d_city].tr(' ', '_') +
                             '.csv' :
                               'df1_originals.csv')
      }
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
        format.html { redirect_to df1_original_url(@df1_original), notice: "Df1 original was successfully created." }
        format.json { render :show, status: :created, location: @df1_original }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @df1_original.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /df1_originals/1 or /df1_originals/1.json
  def update
    respond_to do |format|
      if @df1_original.update(df1_original_params)
        format.html { redirect_to df1_original_url(@df1_original), notice: "Df1 original was successfully updated." }
        format.json { render :show, status: :ok, location: @df1_original }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @df1_original.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /df1_originals/1 or /df1_originals/1.json
  def destroy
    @df1_original.destroy

    respond_to do |format|
      format.html { redirect_to df1_originals_url, notice: "Df1 original was successfully destroyed." }
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
      params.require(:df1_original).permit(:record_type, :serial_no, :city)
    end
end
