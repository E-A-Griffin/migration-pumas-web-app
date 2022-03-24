# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_03_233056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocation_flags", primary_key: ["serial_no", "person_number", "state"], force: :cascade do |t|
    t.decimal "state", precision: 2, null: false
    t.string "serial_no", limit: 13, null: false
    t.decimal "person_number", precision: 2, null: false
    t.boolean "age_alloc_flag"
    t.boolean "ancestry_alloc_flag"
    t.boolean "citizenship_alloc_flag"
    t.boolean "year_of_naturalization_alloc_flag"
    t.boolean "class_of_worker_alloc_flag"
    t.boolean "self_care_alloc_flag"
    t.boolean "hearing_difficulty_alloc_flag"
    t.boolean "vision_difficulty_alloc_flag"
    t.boolean "disability_recode_alloc_flag"
    t.boolean "independent_living_difficulty_alloc_flag"
    t.boolean "ambulatory_difficulty_alloc_flag"
    t.boolean "disability_rating_percentage_alloc_flag"
    t.boolean "disability_rating_checkbox_alloc_flag"
    t.boolean "cognitive_difficulty_alloc_flag"
    t.boolean "ability_to_speak_english_alloc_flag"
    t.boolean "employment_status_recode_alloc_flag"
    t.boolean "gave_birth_last_year_alloc_flag"
    t.boolean "field_of_degree_alloc_flag"
    t.boolean "grandparents_living_w_grandchildren_alloc_flag"
    t.boolean "length_of_time_responsible_for_grandchildren_alloc_flag"
    t.boolean "grandparents_responsible_for_grandchildren_alloc_flag"
    t.boolean "insurance_recode_alloc_flag"
    t.boolean "insurance_through_employer_alloc_flag"
    t.boolean "insurance_direct_alloc_flag"
    t.boolean "medicare_coverage_given_through_eligibility_alloc_flag"
    t.boolean "medicare_65_or_older_certain_disabilities_alloc_flag"
    t.boolean "medicare_coverage_given_through_eligibility_alloc_flag2"
    t.boolean "govt_assistance_alloc_flag"
    t.boolean "tricare_through_eligibility_alloc_flag"
    t.boolean "trcare_alloc_flag"
    t.boolean "va_alloc_flag"
    t.boolean "ind_health_service_alloc_flag"
    t.boolean "detailed_hispanic_origin_alloc_flag"
    t.boolean "industry_alloc_flag"
    t.boolean "interest_dividend_rental_income_alloc_flag"
    t.boolean "time_of_departure_to_work_alloc_flag"
    t.boolean "travel_time_to_work_alloc_flag"
    t.boolean "vehicle_occupancy_alloc_flag"
    t.boolean "means_of_transportation_alloc_flag"
    t.boolean "language_other_than_english_spoken_at_home_alloc_flag"
    t.boolean "language_other_than_english_alloc_flag"
    t.boolean "marital_status_alloc_flag"
    t.boolean "divorced_last_year_alloc_flag"
    t.boolean "married_last_year_alloc_flag"
    t.boolean "times_married_alloc_flag"
    t.boolean "widowed_last_year_alloc_flag"
    t.boolean "year_last_married_alloc_flag"
    t.boolean "mobility_status_alloc_flag"
    t.boolean "migration_state_alloc_flag"
    t.boolean "military_periods_of_service_alloc_flag"
    t.boolean "military_service_alloc_flag"
    t.boolean "occupation_alloc_flag"
    t.boolean "all_other_income_alloc_flag"
    t.boolean "public_assistance_income_alloc_flag"
    t.boolean "total_persons_earnings_alloc_flag"
    t.boolean "total_persons_income_alloc_flag"
    t.boolean "place_of_birth_alloc_flag"
    t.boolean "place_of_work_state_alloc_flag"
    t.boolean "private_health_insurance_coverage_recode_alloc_flag"
    t.boolean "public_health_coverage_recode_alloc_flag"
    t.boolean "detailed_race_alloc_flag"
    t.boolean "relationship_alloc_flag"
    t.boolean "retirement_income_alloc_flag"
    t.boolean "grade_attending_alloc_flag"
    t.boolean "highest_education_alloc_flag"
    t.boolean "school_enrollment_alloc_flag"
    t.boolean "self_employment_income_alloc_flag"
    t.boolean "sex_allocation_flag"
    t.boolean "supplementary_security_income_alloc_flag"
    t.boolean "social_security_income_alloc_flag"
    t.boolean "wages_and_salary_income_alloc_flag"
    t.boolean "usual_hours_worked_per_week_last_year_alloc_flag"
    t.boolean "last_worked_alloc_flag"
    t.boolean "weeks_worked_numeric_last_year_alloc_flag"
    t.boolean "weeks_worked_last_year_alloc_flag"
    t.boolean "worked_last_week_alloc_flag"
    t.boolean "year_of_entry_alloc_flag"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "census_puma_relation", id: :serial, force: :cascade do |t|
    t.decimal "st", precision: 2
    t.integer "county"
    t.integer "tract_ce"
    t.integer "puma_5ce"
    t.index ["st"], name: "state_index"
  end

  create_table "crosswalk_2000_2010", id: false, force: :cascade do |t|
    t.decimal "st00", precision: 2
    t.integer "migpuma00"
    t.integer "geoid00"
    t.integer "gismatch00"
    t.decimal "st10", precision: 2
    t.integer "migpuma10"
    t.integer "geoid10"
    t.integer "gismatch10"
    t.string "st10_name", limit: 20
    t.integer "migpuma00_pop00"
    t.integer "migpuma10_pop00"
    t.integer "part_pop00"
    t.decimal "pmigpuma00_pop00"
    t.decimal "pmigpuma10_pop00"
    t.integer "migpuma00_pop10"
    t.integer "migpuma10_pop10"
    t.integer "part_pop10"
    t.decimal "pmigpuma00_pop10"
    t.decimal "pmigpuma10_pop10"
    t.bigint "migpuma00_land"
    t.bigint "migpuma10_land"
    t.bigint "part_land"
    t.decimal "pmigpuma00_land"
    t.decimal "pmigpuma10_land"
  end

  create_table "df1", id: false, force: :cascade do |t|
    t.integer "row_number"
    t.string "record_type", limit: 1
    t.string "serial_no", limit: 13
    t.string "division", limit: 1
    t.decimal "person_number", precision: 2
    t.string "puma", limit: 5
    t.string "region", limit: 1
    t.decimal "state", precision: 2
    t.string "adjustment_factor", limit: 7
    t.decimal "person_weight", precision: 5
    t.decimal "age", precision: 2
    t.string "citizenship_status", limit: 1
    t.decimal "naturalization_year", precision: 4
    t.string "worker_class", limit: 1
    t.string "english_ability", limit: 1
    t.string "gave_birth_last_year", limit: 1
    t.string "grandparents_w_grandchildren", limit: 1
    t.string "length_responsible_for_grandchildren", limit: 1
    t.string "grandparents_responsible_for_grandchildren", limit: 1
    t.decimal "interest_div_rental_income_last_year", precision: 6
    t.decimal "travel_time_to_work", precision: 3
    t.decimal "vehicle_occupancy", precision: 2
    t.string "means_of_transportation_to_work", limit: 2
    t.string "language_other_than_english", limit: 1
    t.string "marital_status", limit: 1
    t.string "divorced_in_last_year", limit: 1
    t.string "married_in_last_year", limit: 1
    t.string "n_times_married", limit: 1
    t.string "widowed_in_last_year", limit: 1
    t.decimal "year_last_married", precision: 4
    t.string "mobility_status", limit: 1
    t.string "temp_absence_from_work", limit: 1
    t.string "available_for_work", limit: 1
    t.string "on_layoff", limit: 1
    t.string "looking_for_work", limit: 1
    t.string "informed_of_recall", limit: 1
    t.decimal "other_income_last_year", precision: 6
    t.decimal "public_assistance_income_last_year", precision: 5
    t.string "relationship_to_ref_person", limit: 2
    t.decimal "retirement_income_last_year", precision: 6
    t.string "school_enrollment", limit: 1
    t.string "grade_attending", limit: 2
    t.string "educational_attainment", limit: 2
    t.decimal "self_employed_income_last_year", precision: 6
    t.string "sex", limit: 1
    t.decimal "supp_security_income_last_year", precision: 5
    t.decimal "social_security_income_last_year", precision: 5
    t.decimal "salary_last_year", precision: 6
    t.decimal "usual_work_hours", precision: 2
    t.string "last_worked", limit: 1
    t.string "weeks_worked_last_year", limit: 1
    t.decimal "weeks_worked_2019_or_later", precision: 2
    t.string "worked_last_week", limit: 1
    t.decimal "year_of_entry", precision: 4
    t.string "ancestry_recode", limit: 1
    t.string "ancestry_recode_first_entry", limit: 3
    t.string "ancestry_recode_second_entry", limit: 3
    t.string "decade_of_entry", limit: 1
    t.string "number_of_vehicles", limit: 1
    t.string "parents_employment", limit: 1
    t.string "employment_status_recode", limit: 1
    t.string "recode_field_of_degree_first_entry", limit: 4
    t.string "recode_field_of_degree_second_entry", limit: 4
    t.string "hispanic_origin_recode", limit: 2
    t.string "industry_recode_for_2018_or_later", limit: 4
    t.string "time_of_arrival_at_work", limit: 3
    t.string "time_of_departure_for_work", limit: 3
    t.string "language_other_than_english_code", limit: 4
    t.string "migration_puma_2010_census", limit: 5
    t.string "migration_recode", limit: 3
    t.string "married_spouse_present", limit: 1
    t.string "naics_recode_for_2018_or_later", limit: 8
    t.string "nativity", limit: 1
    t.string "nativity_parent", limit: 1
    t.string "own_child", limit: 1
    t.string "occcupation_recode_for_2018_or_later", limit: 4
    t.string "presence_and_age_of_childen", limit: 1
    t.decimal "total_persons_earnings", precision: 7
    t.decimal "total_persons_income", precision: 7
    t.string "place_of_birth", limit: 3
    t.decimal "income_to_poverty_recode", precision: 3
    t.string "place_of_work_puma", limit: 5
    t.string "place_of_work_state_country", limit: 3
    t.string "quarter_of_birth", limit: 1
    t.string "recoded_race_code", limit: 1
    t.string "recoded_race_code2", limit: 2
    t.string "recoded_race_code3", limit: 3
    t.boolean "native_american_recode"
    t.boolean "asian_recode"
    t.boolean "black_recode"
    t.boolean "native_hawaiian_recode"
    t.string "n_races_represented", limit: 1
    t.boolean "pacific_islander_recode"
    t.boolean "other_races_recode"
    t.boolean "white_recode"
    t.boolean "related_child"
    t.string "field_of_degree_science_and_engineering", limit: 1
    t.string "field_of_degree_science_and_engineering_related", limit: 1
    t.string "subfamily_number", limit: 1
    t.string "subfamily_relationship", limit: 1
    t.string "soc_codes_for_2018_and_later", limit: 6
    t.string "vet_period_of_service", limit: 2
    t.string "world_area_of_birth", limit: 1
    t.string "puma_d", limit: 8
    t.integer "migpuma_o"
    t.integer "migpuma_d"
    t.decimal "state_o", precision: 2
    t.index ["migpuma_d"], name: "migpuma_d_index"
  end

  create_table "df1_original", id: false, force: :cascade do |t|
    t.integer "row_number"
    t.string "record_type", limit: 1
    t.string "serial_no", limit: 13
    t.string "division", limit: 1
    t.decimal "person_number", precision: 2
    t.string "puma", limit: 5
    t.string "region", limit: 1
    t.string "state", limit: 2
    t.string "adjustment_factor", limit: 7
    t.decimal "person_weight", precision: 5
    t.decimal "age", precision: 2
    t.string "citizenship_status", limit: 1
    t.decimal "naturalization_year", precision: 4
    t.string "worker_class", limit: 1
    t.string "self_care_difficulty", limit: 1
    t.string "hearing_difficulty", limit: 1
    t.string "vision_difficulty", limit: 1
    t.string "independent_living_difficulty", limit: 1
    t.string "ambulatory_difficulty", limit: 1
    t.string "vet_disability_rating", limit: 1
    t.string "vet_disability", limit: 1
    t.string "cognitive_difficulty", limit: 1
    t.string "english_ability", limit: 1
    t.string "gave_birth_last_year", limit: 1
    t.string "grandparents_w_grandchildren", limit: 1
    t.string "length_responsible_for_grandchildren", limit: 1
    t.string "grandparents_responsible_for_grandchildren", limit: 1
    t.string "insurance_through_employer", limit: 1
    t.string "insurance_purchased_directly", limit: 1
    t.string "medicare", limit: 1
    t.string "medicaid_etc", limit: 1
    t.string "tricare", limit: 1
    t.string "va", limit: 1
    t.string "ind_health_service", limit: 1
    t.decimal "interest_div_rental_income_last_year", precision: 6
    t.decimal "travel_time_to_work", precision: 3
    t.decimal "vehicle_occupancy", precision: 2
    t.string "means_of_transportation_to_work", limit: 2
    t.string "language_other_than_english", limit: 1
    t.string "marital_status", limit: 1
    t.string "divorced_in_last_year", limit: 1
    t.string "married_in_last_year", limit: 1
    t.string "n_times_married", limit: 1
    t.string "widowed_in_last_year", limit: 1
    t.decimal "year_last_married", precision: 4
    t.string "mobility_status", limit: 1
    t.string "military_service", limit: 1
    t.boolean "served_after_09_2001"
    t.boolean "served_from_08_1990_to_08_2001"
    t.boolean "served_from_05_1975_to_07_1990"
    t.boolean "served_from_08_1964_to_04_1975"
    t.boolean "served_from_02_1955_to_07_1964"
    t.boolean "served_from_07_1950_to_01_1955"
    t.boolean "served_from_01_1947_to_06_1950"
    t.boolean "served_from_12_1941_to_12_1946"
    t.boolean "served_before_11_1941"
    t.string "temp_absence_from_work", limit: 1
    t.string "available_for_work", limit: 1
    t.string "on_layoff", limit: 1
    t.string "looking_for_work", limit: 1
    t.string "informed_of_recall", limit: 1
    t.decimal "other_income_last_year", precision: 6
    t.decimal "public_assistance_income_last_year", precision: 5
    t.string "relationship_to_ref_person", limit: 2
    t.decimal "retirement_income_last_year", precision: 6
    t.string "school_enrollment", limit: 1
    t.string "grade_attending", limit: 2
    t.string "educational_attainment", limit: 2
    t.decimal "self_employed_income_last_year", precision: 6
    t.string "sex", limit: 1
    t.decimal "supp_security_income_last_year", precision: 5
    t.decimal "social_security_income_last_year", precision: 5
    t.decimal "salary_last_year", precision: 6
    t.decimal "usual_work_hours", precision: 2
    t.string "last_worked", limit: 1
    t.string "weeks_worked_last_year", limit: 1
    t.decimal "weeks_worked_2019_or_later", precision: 2
    t.string "worked_last_week", limit: 1
    t.decimal "year_of_entry", precision: 4
    t.string "ancestry_recode", limit: 1
    t.string "ancestry_recode_first_entry", limit: 3
    t.string "ancestry_recode_second_entry", limit: 3
    t.string "decade_of_entry", limit: 1
    t.string "disability_recode", limit: 1
    t.string "number_of_vehicles", limit: 1
    t.string "parents_employment", limit: 1
    t.string "employment_status_recode", limit: 1
    t.string "recode_field_of_degree_first_entry", limit: 4
    t.string "recode_field_of_degree_second_entry", limit: 4
    t.string "health_insurance_recode", limit: 1
    t.string "hispanic_origin_recode", limit: 2
    t.string "industry_recode_for_2018_or_later", limit: 4
    t.string "time_of_arrival_at_work", limit: 3
    t.string "time_of_departure_for_work", limit: 3
    t.string "language_other_than_english_code", limit: 4
    t.string "migration_puma_2010_census", limit: 5
    t.string "migration_recode", limit: 3
    t.string "married_spouse_present", limit: 1
    t.string "naics_recode_for_2018_or_later", limit: 8
    t.string "nativity", limit: 1
    t.string "nativity_parent", limit: 1
    t.string "own_child", limit: 1
    t.string "occcupation_recode_for_2018_or_later", limit: 4
    t.string "presence_and_age_of_childen", limit: 1
    t.decimal "total_persons_earnings", precision: 7
    t.decimal "total_persons_income", precision: 7
    t.string "place_of_birth", limit: 3
    t.decimal "income_to_poverty_recode", precision: 3
    t.string "place_of_work_puma", limit: 5
    t.string "place_of_work_state_country", limit: 3
    t.string "private_health_cov_recode", limit: 1
    t.string "public_health_cov_recode", limit: 1
    t.string "quarter_of_birth", limit: 1
    t.string "recoded_race_code", limit: 1
    t.string "recoded_race_code2", limit: 2
    t.string "recoded_race_code3", limit: 3
    t.boolean "native_american_recode"
    t.boolean "asian_recode"
    t.boolean "black_recode"
    t.boolean "native_hawaiian_recode"
    t.string "n_races_represented", limit: 1
    t.boolean "pacific_islander_recode"
    t.boolean "other_races_recode"
    t.boolean "white_recode"
    t.boolean "related_child"
    t.string "field_of_degree_science_and_engineering", limit: 1
    t.string "field_of_degree_science_and_engineering_related", limit: 1
    t.string "subfamily_number", limit: 1
    t.string "subfamily_relationship", limit: 1
    t.string "soc_codes_for_2018_and_later", limit: 6
    t.string "vet_period_of_service", limit: 2
    t.string "world_area_of_birth", limit: 1
    t.boolean "age_alloc_flag"
    t.boolean "ancestry_alloc_flag"
    t.boolean "citizenship_alloc_flag"
    t.boolean "year_of_naturalization_alloc_flag"
    t.boolean "class_of_worker_alloc_flag"
    t.boolean "self_care_alloc_flag"
    t.boolean "hearing_difficulty_alloc_flag"
    t.boolean "vision_difficulty_alloc_flag"
    t.boolean "disability_recode_alloc_flag"
    t.boolean "independent_living_difficulty_alloc_flag"
    t.boolean "ambulatory_difficulty_alloc_flag"
    t.boolean "disability_rating_percentage_alloc_flag"
    t.boolean "disability_rating_checkbox_alloc_flag"
    t.boolean "cognitive_difficulty_alloc_flag"
    t.boolean "ability_to_speak_english_alloc_flag"
    t.boolean "employment_status_recode_alloc_flag"
    t.boolean "gave_birth_last_year_alloc_flag"
    t.boolean "field_of_degree_alloc_flag"
    t.boolean "grandparents_living_w_grandchildren_alloc_flag"
    t.boolean "length_of_time_responsible_for_grandchildren_alloc_flag"
    t.boolean "grandparents_responsible_for_grandchildren_alloc_flag"
    t.boolean "insurance_recode_alloc_flag"
    t.boolean "insurance_through_employer_alloc_flag"
    t.boolean "insurance_direct_alloc_flag"
    t.boolean "medicare_coverage_given_through_eligibility_alloc_flag"
    t.boolean "medicare_65_or_older_certain_disabilities_alloc_flag"
    t.boolean "medicare_coverage_given_through_eligibility_alloc_flag2"
    t.boolean "govt_assistance_alloc_flag"
    t.boolean "tricare_through_eligibility_alloc_flag"
    t.boolean "trcare_alloc_flag"
    t.boolean "va_alloc_flag"
    t.boolean "ind_health_service_alloc_flag"
    t.boolean "detailed_hispanic_origin_alloc_flag"
    t.boolean "industry_alloc_flag"
    t.boolean "interest_dividend_rental_income_alloc_flag"
    t.boolean "time_of_departure_to_work_alloc_flag"
    t.boolean "travel_time_to_work_alloc_flag"
    t.boolean "vehicle_occupancy_alloc_flag"
    t.boolean "means_of_transportation_alloc_flag"
    t.boolean "language_other_than_english_spoken_at_home_alloc_flag"
    t.boolean "language_other_than_english_alloc_flag"
    t.boolean "marital_status_alloc_flag"
    t.boolean "divorced_last_year_alloc_flag"
    t.boolean "married_last_year_alloc_flag"
    t.boolean "times_married_alloc_flag"
    t.boolean "widowed_last_year_alloc_flag"
    t.boolean "year_last_married_alloc_flag"
    t.boolean "mobility_status_alloc_flag"
    t.boolean "migration_state_alloc_flag"
    t.boolean "military_periods_of_service_alloc_flag"
    t.boolean "military_service_alloc_flag"
    t.boolean "occupation_alloc_flag"
    t.boolean "all_other_income_alloc_flag"
    t.boolean "public_assistance_income_alloc_flag"
    t.boolean "total_persons_earnings_alloc_flag"
    t.boolean "total_persons_income_alloc_flag"
    t.boolean "place_of_birth_alloc_flag"
    t.boolean "place_of_work_state_alloc_flag"
    t.boolean "private_health_insurance_coverage_recode_alloc_flag"
    t.boolean "public_health_coverage_recode_alloc_flag"
    t.boolean "detailed_race_alloc_flag"
    t.boolean "relationship_alloc_flag"
    t.boolean "retirement_income_alloc_flag"
    t.boolean "grade_attending_alloc_flag"
    t.boolean "highest_education_alloc_flag"
    t.boolean "school_enrollment_alloc_flag"
    t.boolean "self_employment_income_alloc_flag"
    t.boolean "sex_allocation_flag"
    t.boolean "supplementary_security_income_alloc_flag"
    t.boolean "social_security_income_alloc_flag"
    t.boolean "wages_and_salary_income_alloc_flag"
    t.boolean "usual_hours_worked_per_week_last_year_alloc_flag"
    t.boolean "last_worked_alloc_flag"
    t.boolean "weeks_worked_numeric_last_year_alloc_flag"
    t.boolean "weeks_worked_last_year_alloc_flag"
    t.boolean "worked_last_week_alloc_flag"
    t.boolean "year_of_entry_alloc_flag"
    t.decimal "person_weight_replicate_1", precision: 5
    t.decimal "person_weight_replicate_2", precision: 5
    t.decimal "person_weight_replicate_3", precision: 5
    t.decimal "person_weight_replicate_4", precision: 5
    t.decimal "person_weight_replicate_5", precision: 5
    t.decimal "person_weight_replicate_6", precision: 5
    t.decimal "person_weight_replicate_7", precision: 5
    t.decimal "person_weight_replicate_8", precision: 5
    t.decimal "person_weight_replicate_9", precision: 5
    t.decimal "person_weight_replicate_10", precision: 5
    t.decimal "person_weight_replicate_11", precision: 5
    t.decimal "person_weight_replicate_12", precision: 5
    t.decimal "person_weight_replicate_13", precision: 5
    t.decimal "person_weight_replicate_14", precision: 5
    t.decimal "person_weight_replicate_15", precision: 5
    t.decimal "person_weight_replicate_16", precision: 5
    t.decimal "person_weight_replicate_17", precision: 5
    t.decimal "person_weight_replicate_18", precision: 5
    t.decimal "person_weight_replicate_19", precision: 5
    t.decimal "person_weight_replicate_20", precision: 5
    t.decimal "person_weight_replicate_21", precision: 5
    t.decimal "person_weight_replicate_22", precision: 5
    t.decimal "person_weight_replicate_23", precision: 5
    t.decimal "person_weight_replicate_24", precision: 5
    t.decimal "person_weight_replicate_25", precision: 5
    t.decimal "person_weight_replicate_26", precision: 5
    t.decimal "person_weight_replicate_27", precision: 5
    t.decimal "person_weight_replicate_28", precision: 5
    t.decimal "person_weight_replicate_29", precision: 5
    t.decimal "person_weight_replicate_30", precision: 5
    t.decimal "person_weight_replicate_31", precision: 5
    t.decimal "person_weight_replicate_32", precision: 5
    t.decimal "person_weight_replicate_33", precision: 5
    t.decimal "person_weight_replicate_34", precision: 5
    t.decimal "person_weight_replicate_35", precision: 5
    t.decimal "person_weight_replicate_36", precision: 5
    t.decimal "person_weight_replicate_37", precision: 5
    t.decimal "person_weight_replicate_38", precision: 5
    t.decimal "person_weight_replicate_39", precision: 5
    t.decimal "person_weight_replicate_40", precision: 5
    t.decimal "person_weight_replicate_41", precision: 5
    t.decimal "person_weight_replicate_42", precision: 5
    t.decimal "person_weight_replicate_43", precision: 5
    t.decimal "person_weight_replicate_44", precision: 5
    t.decimal "person_weight_replicate_45", precision: 5
    t.decimal "person_weight_replicate_46", precision: 5
    t.decimal "person_weight_replicate_47", precision: 5
    t.decimal "person_weight_replicate_48", precision: 5
    t.decimal "person_weight_replicate_49", precision: 5
    t.decimal "person_weight_replicate_50", precision: 5
    t.decimal "person_weight_replicate_51", precision: 5
    t.decimal "person_weight_replicate_52", precision: 5
    t.decimal "person_weight_replicate_53", precision: 5
    t.decimal "person_weight_replicate_54", precision: 5
    t.decimal "person_weight_replicate_55", precision: 5
    t.decimal "person_weight_replicate_56", precision: 5
    t.decimal "person_weight_replicate_57", precision: 5
    t.decimal "person_weight_replicate_58", precision: 5
    t.decimal "person_weight_replicate_59", precision: 5
    t.decimal "person_weight_replicate_60", precision: 5
    t.decimal "person_weight_replicate_61", precision: 5
    t.decimal "person_weight_replicate_62", precision: 5
    t.decimal "person_weight_replicate_63", precision: 5
    t.decimal "person_weight_replicate_64", precision: 5
    t.decimal "person_weight_replicate_65", precision: 5
    t.decimal "person_weight_replicate_66", precision: 5
    t.decimal "person_weight_replicate_67", precision: 5
    t.decimal "person_weight_replicate_68", precision: 5
    t.decimal "person_weight_replicate_69", precision: 5
    t.decimal "person_weight_replicate_70", precision: 5
    t.decimal "person_weight_replicate_71", precision: 5
    t.decimal "person_weight_replicate_72", precision: 5
    t.decimal "person_weight_replicate_73", precision: 5
    t.decimal "person_weight_replicate_74", precision: 5
    t.decimal "person_weight_replicate_75", precision: 5
    t.decimal "person_weight_replicate_76", precision: 5
    t.decimal "person_weight_replicate_77", precision: 5
    t.decimal "person_weight_replicate_78", precision: 5
    t.decimal "person_weight_replicate_79", precision: 5
    t.decimal "person_weight_replicate_80", precision: 5
    t.string "puma_d", limit: 8
    t.string "migpuma_o", limit: 8
    t.string "migpuma_d", limit: 8
  end

  create_table "health_info", primary_key: ["serial_no", "person_number", "state"], force: :cascade do |t|
    t.decimal "state", precision: 2, null: false
    t.string "serial_no", limit: 13, null: false
    t.decimal "person_number", precision: 2, null: false
    t.boolean "self_care_difficulty"
    t.boolean "hearing_difficulty"
    t.boolean "vision_difficulty"
    t.boolean "independent_living_difficulty"
    t.boolean "ambulatory_difficulty"
    t.boolean "vet_disability_rating"
    t.boolean "vet_disability"
    t.boolean "cognitive_difficulty"
    t.boolean "insurance_through_employer"
    t.boolean "insurance_purchased_directly"
    t.boolean "medicare"
    t.boolean "medicaid_etc"
    t.boolean "tricare"
    t.boolean "va"
    t.boolean "ind_health_service"
    t.boolean "disability_recode"
    t.boolean "health_insurance_recode"
    t.boolean "private_health_cov_recode"
    t.boolean "public_health_cov_recode"
  end

  create_table "migpuma_cw", primary_key: "rowid", id: :decimal, force: :cascade do |t|
    t.decimal "migpuma2"
    t.decimal "migpuma10_pop10"
  end

  create_table "msa_delineation_2018", primary_key: ["fips_state_code", "fips_county_code"], force: :cascade do |t|
    t.integer "cbsa_code"
    t.integer "metro_div_code"
    t.integer "csa_code"
    t.string "cbsa_title", limit: 100
    t.string "metro_micro_stat_area", limit: 100
    t.string "metro_div_title", limit: 200
    t.string "csa_title", limit: 100
    t.string "county_equivalent", limit: 100
    t.string "st_name", limit: 20
    t.integer "fips_state_code", null: false
    t.integer "fips_county_code", null: false
    t.string "central_or_outlying", limit: 20
  end

  create_table "out_move", primary_key: "rowid", id: :integer, default: nil, force: :cascade do |t|
    t.integer "migpuma_o"
    t.integer "migpuma_d"
    t.integer "person"
    t.point "cent_o"
    t.point "cent_d"
    t.integer "stfips_o"
    t.integer "stfips_d"
    t.decimal "distance"
    t.string "state_o", limit: 2
    t.string "state_d", limit: 2
  end

  create_table "personweightreplicates", primary_key: ["serial_no", "person_number"], force: :cascade do |t|
    t.string "serial_no", limit: 13, null: false
    t.decimal "person_number", precision: 2, null: false
    t.decimal "person_weight_replicate_1", precision: 5
    t.decimal "person_weight_replicate_2", precision: 5
    t.decimal "person_weight_replicate_3", precision: 5
    t.decimal "person_weight_replicate_4", precision: 5
    t.decimal "person_weight_replicate_5", precision: 5
    t.decimal "person_weight_replicate_6", precision: 5
    t.decimal "person_weight_replicate_7", precision: 5
    t.decimal "person_weight_replicate_8", precision: 5
    t.decimal "person_weight_replicate_9", precision: 5
    t.decimal "person_weight_replicate_10", precision: 5
    t.decimal "person_weight_replicate_11", precision: 5
    t.decimal "person_weight_replicate_12", precision: 5
    t.decimal "person_weight_replicate_13", precision: 5
    t.decimal "person_weight_replicate_14", precision: 5
    t.decimal "person_weight_replicate_15", precision: 5
    t.decimal "person_weight_replicate_16", precision: 5
    t.decimal "person_weight_replicate_17", precision: 5
    t.decimal "person_weight_replicate_18", precision: 5
    t.decimal "person_weight_replicate_19", precision: 5
    t.decimal "person_weight_replicate_20", precision: 5
    t.decimal "person_weight_replicate_21", precision: 5
    t.decimal "person_weight_replicate_22", precision: 5
    t.decimal "person_weight_replicate_23", precision: 5
    t.decimal "person_weight_replicate_24", precision: 5
    t.decimal "person_weight_replicate_25", precision: 5
    t.decimal "person_weight_replicate_26", precision: 5
    t.decimal "person_weight_replicate_27", precision: 5
    t.decimal "person_weight_replicate_28", precision: 5
    t.decimal "person_weight_replicate_29", precision: 5
    t.decimal "person_weight_replicate_30", precision: 5
    t.decimal "person_weight_replicate_31", precision: 5
    t.decimal "person_weight_replicate_32", precision: 5
    t.decimal "person_weight_replicate_33", precision: 5
    t.decimal "person_weight_replicate_34", precision: 5
    t.decimal "person_weight_replicate_35", precision: 5
    t.decimal "person_weight_replicate_36", precision: 5
    t.decimal "person_weight_replicate_37", precision: 5
    t.decimal "person_weight_replicate_38", precision: 5
    t.decimal "person_weight_replicate_39", precision: 5
    t.decimal "person_weight_replicate_40", precision: 5
    t.decimal "person_weight_replicate_41", precision: 5
    t.decimal "person_weight_replicate_42", precision: 5
    t.decimal "person_weight_replicate_43", precision: 5
    t.decimal "person_weight_replicate_44", precision: 5
    t.decimal "person_weight_replicate_45", precision: 5
    t.decimal "person_weight_replicate_46", precision: 5
    t.decimal "person_weight_replicate_47", precision: 5
    t.decimal "person_weight_replicate_48", precision: 5
    t.decimal "person_weight_replicate_49", precision: 5
    t.decimal "person_weight_replicate_50", precision: 5
    t.decimal "person_weight_replicate_51", precision: 5
    t.decimal "person_weight_replicate_52", precision: 5
    t.decimal "person_weight_replicate_53", precision: 5
    t.decimal "person_weight_replicate_54", precision: 5
    t.decimal "person_weight_replicate_55", precision: 5
    t.decimal "person_weight_replicate_56", precision: 5
    t.decimal "person_weight_replicate_57", precision: 5
    t.decimal "person_weight_replicate_58", precision: 5
    t.decimal "person_weight_replicate_59", precision: 5
    t.decimal "person_weight_replicate_60", precision: 5
    t.decimal "person_weight_replicate_61", precision: 5
    t.decimal "person_weight_replicate_62", precision: 5
    t.decimal "person_weight_replicate_63", precision: 5
    t.decimal "person_weight_replicate_64", precision: 5
    t.decimal "person_weight_replicate_65", precision: 5
    t.decimal "person_weight_replicate_66", precision: 5
    t.decimal "person_weight_replicate_67", precision: 5
    t.decimal "person_weight_replicate_68", precision: 5
    t.decimal "person_weight_replicate_69", precision: 5
    t.decimal "person_weight_replicate_70", precision: 5
    t.decimal "person_weight_replicate_71", precision: 5
    t.decimal "person_weight_replicate_72", precision: 5
    t.decimal "person_weight_replicate_73", precision: 5
    t.decimal "person_weight_replicate_74", precision: 5
    t.decimal "person_weight_replicate_75", precision: 5
    t.decimal "person_weight_replicate_76", precision: 5
    t.decimal "person_weight_replicate_77", precision: 5
    t.decimal "person_weight_replicate_78", precision: 5
    t.decimal "person_weight_replicate_79", precision: 5
    t.decimal "person_weight_replicate_80", precision: 5
  end

  create_table "puma_to_powpuma_relation", id: false, force: :cascade do |t|
    t.integer "res_state"
    t.integer "puma"
    t.integer "work_state"
    t.integer "pw_puma00_migpuma1"
  end

  create_table "vet_info", primary_key: ["serial_no", "person_number"], force: :cascade do |t|
    t.decimal "state", precision: 2
    t.string "serial_no", limit: 13, null: false
    t.decimal "person_number", precision: 2, null: false
    t.string "military_service", limit: 1
    t.boolean "served_after_09_2001"
    t.boolean "served_from_08_1990_to_08_2001"
    t.boolean "served_from_05_1975_to_07_1990"
    t.boolean "served_from_08_1964_to_04_1975"
    t.boolean "served_from_02_1955_to_07_1964"
    t.boolean "served_from_07_1950_to_01_1955"
    t.boolean "served_from_01_1947_to_06_1950"
    t.boolean "served_from_12_1941_to_12_1946"
    t.boolean "served_before_11_1941"
  end

  add_foreign_key "df1", "health_info", column: "serial_no", primary_key: "serial_no", name: "df1_to_health_info_fk"
  add_foreign_key "df1", "personweightreplicates", column: "serial_no", primary_key: "serial_no", name: "df1_to_personweightreplicates_fk"
  add_foreign_key "df1", "vet_info", column: "serial_no", primary_key: "serial_no", name: "df1_to_vet_info_fk"
end
