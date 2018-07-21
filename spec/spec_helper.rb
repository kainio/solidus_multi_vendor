require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

begin
  require File.expand_path('../dummy/config/environment', __FILE__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'pry'
require 'ffaker'
require 'rspec/rails'

include Warden::Test::Helpers
Warden.test_mode!


Dir[File.join(File.dirname(__FILE__), '/support/**/*.rb')].each { |file| require file }

include Warden::Test::Helpers
Warden.test_mode!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.before :each do
    Rails.cache.clear
  end
  config.before :all do
    ENV['PRECOMPILE_ASSETS'] ||= begin
      case self.class.metadata[:type]
      when :feature, :view
        STDOUT.write "Precompiling assets..."

        require 'rake'
        Rails.application.load_tasks
        Rake::Task['assets:precompile'].invoke

        STDOUT.puts " done."
        Time.now.to_s
      end
    end
  end
end
