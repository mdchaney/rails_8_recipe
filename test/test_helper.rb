ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def login(email_address, password)
      post session_path, params: { email_address: email_address, password: password }
    end

    def login_cap(email_address, password)
      visit new_session_path
      fill_in "Email address", with: email_address
      fill_in "Password", with: password
      click_on "Sign in"
      assert_text "Rails 8 Recipe"
    end
  end
end
