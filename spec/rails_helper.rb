# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
	# Capybara DSL
	config.include Capybara::DSL

  #FactoryGirl integration
	config.include FactoryGirl::Syntax::Methods
	# Sorcery helper integration
	config.infer_spec_type_from_file_location!
	config.include Sorcery::TestHelpers::Rails::Controller, type: :controller
	config.include Sorcery::TestHelpers::Rails::Integration, type: :feature

	config.include(Shoulda::Matchers::ActiveModel, type: :model)
	config.include(Shoulda::Matchers::ActiveRecord, type: :model)

	include Sorcery::TestHelpers
	require File.expand_path("../../config/environment", __FILE__)

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

end


