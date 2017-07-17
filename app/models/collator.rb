
require "everypolitician"
require "rest-client"

class Collator

  private

  def get_target_dataset
    Everypolitician::Index.new.country("UK")
  end

  def get_source_for_term_data
     legislature = get_target_data[:legislatures]
     current_term = legislature[0][:legislative_periods]
  end

  def get_term_data
     csv_path = get_source_for_term_data[0][:csv_url]
     eachpol_response = RestClient.get(csv_path)
  end

  public

  def csv_term_data
     CSV.open("../term_data.csv", "w") {|csv| csv << [get_term_data.body] }
  end

end
