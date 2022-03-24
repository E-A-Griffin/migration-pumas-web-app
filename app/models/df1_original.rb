class Df1Original < ApplicationRecord
  # Shared variable
  @@TOP_10_METRO = {"New York-Newark-Jersey City"         => 408,
                    "Los Angeles-Long Beach-Anaheim"      => 348,
                    "Chicago-Naperville-Elgin"            => 176,
                    "Dallas-Fort Worth-Arlington"         => 206,
                    "Houston-The Woodlands-Sugar Land"    => 288,
                    "Washington-Arlington-Alexandria"     => 548,
                    "Philadelphia-Camden-Wilmington"      => 428,
                    "Miami-Fort Lauderdale-Pompano Beach" => 370,
                    "Atlanta-Sandy Springs-Alpharetta"    => 122,
                    "Boston-Cambridge-Newton"             => 148}
  self.table_name = 'df1_original'
  self.primary_key = 'serial_no'

  def self.get_top_10_metro
    return @@TOP_10_METRO
  end

  def self.metro_name_to_CSA(metro_name)
    return @@TOP_10_METRO[metro_name]
  end

  def print_top_10_metro
      @@TOP_10_METRO.each do |k, v|
        puts "#{k} => #{v}"
      end
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << %w{state}

      csv << "garbage"
      csv << "more garbage"
      # all.each do |row|
      #   csv << row.attributes.values_at(*attributes)
      # end
    end
  end
end
