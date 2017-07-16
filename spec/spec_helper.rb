ENV['RACK_ENV'] = 'test'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/app.rb'
require './app/models/project.rb'
require 'database_cleaner'
require_relative 'helpers/projects'

Capybara.app = SuperCrafts

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,

])
SimpleCov.start

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
   config.before(:suite) do
     DatabaseCleaner.strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
   end

   # Everything in this block runs once before each individual test
   config.before(:each) do
     DatabaseCleaner.start
   end

   # Everything in this block runs once after each individual test
   config.after(:each) do
     DatabaseCleaner.clean
   end
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end