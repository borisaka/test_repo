source "https://rubygems.org"

ruby "2.3.0"

rails_version = "4.2.5.2"
%w(railties activemodel actionview actionpack actionmailer).each do |name|
  gem name, rails_version
end

# Use postgresql as the database for Active Record
gem "pg", "~> 0.15"

# Utils
gem "envied"
gem "sentry-raven"
gem "jwt"
gem "money"
gem "anima"
gem "countries", path: "./vendor/gems/countries-2.0.0.pre.3"

# ROM related
gem "rom", "~>1.0.0"
gem "rom-sql", "~>0.7.0"
gem "rom-rails", "~>0.6.0"
gem "rom-model", "~>0.2.0"
gem "rom-repository", "~>0.2.0"

gem "dry-container", "~>0.3.0"
gem "dry-auto_inject", "~>0.2.0"
gem "dry-validation", "~>0.7.3"

gem "puma"

group :development, :test do
  gem "pry-rails"

  # testing
  gem "rspec-rails", "~> 3.0"

  # analysis and security
  gem "brakeman"
  gem "rubocop", "~>0.38.0"
  gem "bundler-audit"
end

group :test do
  gem "database_cleaner"
  gem "simplecov", require: false
end
