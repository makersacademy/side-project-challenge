
require "twitter"
require_relative "collator"
require_relative "parser"

class Twit

  attr_reader :tweets

  def initialize(collator = Collator.new, parser = Parser.new)
    @tweets = []
    @collator = collator
    @parser = parser
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'eEyjtVNuLFGABhJsgr94xWq0s'
      config.consumer_secret     = "4jYRD3wSuNpP2g1yprNIzzWJbaHoq4BZW3M4CEpmVcbfXPrJC9"
      config.access_token        = "88029736-hgpZzji8XYopv8pIsv2CoWD05eGUnGoVJlwZWXvgC"
      config.access_token_secret = "jqOE6t9gRE4hr6yyG1Pm7lhxTQ27trGoVU1tG9Q85Nuaa"
    end
  end

  def get_tweets_for(name)
      tweets << client.user_timeline(screen_name: parser.find_twitter_handle_of(name), count: 10)
    rescue
      File.open("error_log.txt", 'w') { |file| file.write("Rate limited exceeded at: #{Time.now}") }
  end

  private

  attr_reader :collator, :client, :parser

end
