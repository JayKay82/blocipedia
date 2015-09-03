source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'

# Webserver - Puma
gem 'puma', group: [:development, :production]

# Setup development and test database. SQLite3
gem 'sqlite3', group: [:development, :test]

# Setup production database. Postgres
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Setup a testing environment
group :test do
  gem 'rspec-rails', '~>3.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers'
end

# Authentication & security
gem 'devise'
gem 'figaro', '1.0'

# Gems for markup and styling
gem 'redcarpet'
gem 'haml'
gem 'erb2haml', group: :development
gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'

# Gems for working with JS and JSON
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# Gems for file uploading and image manipulation
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

# Setup payment with Stripe
gem 'stripe'

# Miscellaneous gems
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'faker'

# Gems for debugging
group :development, :test do
  gem 'rubocop', require: false
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
