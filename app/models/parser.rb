
require "csv"

class Parser

  HANDLE = 5

  private

  attr_reader :data

  def load_csv
     @data = []
     CSV.foreach('./app/term_data.csv') {|row| @data << row }
     @data = @data.flatten[0].split("\n")
  end

  def find_index_of(target_politican)
     data.each_with_index do |politician, index|
       return index if politician.split(",").find {|name| name == target_politican}
     end
     false
  end

  def parse_politician_at(index)
    data[index].split(",")
  end

  public

  def find_twitter_handle_of(target_politican)
    load_csv
    index = find_index_of(target_politican)
    return parse_politician_at(index)[HANDLE] if index
  end

end
