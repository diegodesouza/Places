require 'rubygems'
require 'simplecov'

require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
require 'minitest/autorun'
require 'minitest/pride'
require 'database_cleaner'
require 'awesome_print'

require File.expand_path('../../config/environment', __FILE__)

require 'fabrication'

ENV['RAILS_ENV'] = 'test'

SimpleCov.merge_timeout 3600
SimpleCov.start 'rails' do
  # Filters
  add_filter 'lib/tasks' # Don't count rake tasks

  # Groups
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Uploaders', 'app/uploaders'
  add_group 'Authorizers', 'app/authorizers'
  add_group 'Services', 'app/services'
  add_group 'Libraries', 'lib'
end

Fabrication.configure do |config|
  config.fabricator_path = 'test/fabricators'
end

# Improved Minitest output (color and progress bar)
Minitest::Reporters.use!(
  Minitest::Reporters::DefaultReporter.new,
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  fixtures :all
end

# Public: Helper methods for all tests.
module TestHelper
  include Capybara::DSL

  def setup
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def seed_data
  end

  def screenshot
    Capybara::Screenshot.screen_shot_and_open_image
  end

  # Tests that an email is sent to the email address after
  # running given block of code
  #
  # email_address - The String email address to test delivery for
  #
  # Examples
  #
  #   assert_email_sent_to "user@ledger.test" do
  #     Notifier.welcome_email(user).deliver
  #   end
  #
  def assert_email_sent_to(email_address)
    emails = ActionMailer::Base.deliveries
    emails.clear
    wait_for_page_load do
      yield
    end

    assert emails.any?{|email| email["to"].to_s == email_address },
      "Expected email to be sent to #{email_address}"
  end
end
