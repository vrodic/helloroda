source "https://rubygems.org"

# https://andycroll.com/ruby/read-ruby-version-in-your-gemfile/
ruby File.read("#{__dir__}/.ruby-version").strip

gem "erubi", "~> 1.12"
gem "puma", "~> 6.2", require: false
gem "sequel", "~> 5.67"
gem "roda", "~> 3.66"
gem "tilt", "~> 2.1", require: "tilt/erb"
gem "oj", "~> 3.14"
gem "pry", "~> 0.14"
gem "pry-byebug", "~> 3.10"


group :postgresql do
  gem "pg", "~> 1.5", platforms: %i[ruby mswin]
  gem "sequel_pg", "~> 1.17", platforms: :ruby, require: false
end