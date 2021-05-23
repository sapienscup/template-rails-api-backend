source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "bcrypt", "~> 3.1.1"
gem "bootsnap", ">= 1.4.4", require: false
gem "graphql", "~> 1.12.6"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "json_web_token", "~> 0.3.5"
gem "pg", "~> 1.2.2"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.2", ">= 6.1.2.1"
gem "redis", "~> 4.0"
gem "redis-rails", "~> 5.0.2"
gem "sidekiq", "~> 6.1.3"
gem "unicorn", "~> 5.5.5"
gem "acts_as_paranoid", "~> 0.7.0"
gem "hirb", "~> 0.7.3"
gem "awesome_print", "~> 1.8.0"
gem "rails-i18n", "~> 6.0.0"
gem "pry", "~> 0.13.1"

gem "devise", "~> 4.8.0"
gem "simple_token_authentication", "~> 1.0"

group :development, :test do
  gem "byebug", "~> 11.1.3", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", "~> 1.12.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1.1"
  gem "brakeman", "~> 5.0.1"
end

group :test do
  gem "factory_bot_rails", "~> 6.1.0"
  gem "rspec", ">= 3.10.0"
  gem "rspec-rails", ">= 3.9.0"
  gem "simplecov", "~> 0.21.2"
  gem "simplecov-console", "~> 0.9.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# This gem will only be installed on Windows platforms
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
