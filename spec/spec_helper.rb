ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'csv'
require 'capybara/rspec'
require "rspec"
require 'orderly'
require 'simplecov'
require 'simplecov-console'
require_relative 'backend/test_helpers'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
  ])

  SimpleCov.start
  Capybara.app = Politwit

  RSpec.configure do |config|
    config.include(TestHelper)
    config.include(Capybara::DSL)

    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end

    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end


    config.shared_context_metadata_behavior = :apply_to_host_groups
  end
