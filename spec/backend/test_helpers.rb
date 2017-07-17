
module TestHelper

def successful_search
  visit "tweets/new"
  fill_in "name", with: "Tom Watson"
  click_on("Submit")
end


end
