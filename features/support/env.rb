# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'capybara/poltergeist'

# Dodal Vojko
require 'factory_girl_rails'
World(FactoryGirl::Syntax::Methods)

# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css
Capybara.default_max_wait_time = 5

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     DatabaseCleaner.strategy = :truncation, {:except => %w[widgets]}
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :poltergeist
Capybara.register_driver  :poltergeist do |app|
    options = {
        js_errors: true,
        timeout: 120,
        debug: false,
        phantomjs_options: [
          '--load-images=yes',
          '--disk-cache=false',
          '--ignore-ssl-errors=yes',
          '--ssl-protocol=TLSv1'
        ],
        inspector: true
    }
    driver = Capybara::Poltergeist::Driver.new(app, options)
    driver.add_header("Accept-Language", "en")
    driver.resize_window(1920, 1080)
    driver
end

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    #page.evaluate_script('jQuery.active').zero?
    #request_count = page.evaluate_script("$.active").to_i
    #puts "waiting for ajax.. #{page.evaluate_script('jQuery.active').to_i > 0}"
    #request_count && request_count.zero?
    page.evaluate_script('jQuery.active').to_i > 0
    #rescue Timeout::Error
  end
end
World(WaitForAjax)

module TestHelpers
  def word_to_integer(word, zero_based: true)
    supported_words = {
      first: 1,
      second: 2,
      third: 3,
      fourth: 4,
      fifth: 5
    }
    if supported_words.keys.include?(word.to_sym)
      if zero_based
        return supported_words[word.to_sym] - 1
      else
        return supported_words[word.to_sym]
      end
    else
      return nil
    end
  end
end
World(TestHelpers)
