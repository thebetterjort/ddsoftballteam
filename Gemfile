source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'twilio-ruby'
#Bootstrap Gems
gem 'bootstrap-sass', '2.3.2.0'
gem 'devise'

gem 'rails_12factor', group: :production

group :production, :staging do
  gem "pg"
  gem 'unicorn' # make sure you follow installation instructions for this gem
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

group :doc do

  gem 'sdoc', require: false
end
