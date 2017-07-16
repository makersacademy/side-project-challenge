
require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'


include Capybara::DSL

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
  ])
  SimpleCov.start
  Capybara.app = SentimentAnalysis
  
  RSpec.configure do |config|
    # config.include(DataMapper::Matchers)
    # config.include(TestHelper)
    
    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end
    
    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
    
    # config.before(:suite) do
    #   DatabaseCleaner.strategy = :transaction
    #   DatabaseCleaner.clean_with(:truncation)
    # end
    #
    # config.before(:each) do
    #   DatabaseCleaner.start
    # end
    #
    # config.after(:each) do
    #   DatabaseCleaner.clean
    # end
    
    config.shared_context_metadata_behavior = :apply_to_host_groups
  end
  