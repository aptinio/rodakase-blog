source 'https://rubygems.org'

gem 'rake'
gem 'rodakase', github: 'solnic/rodakase', branch: 'master'

gem 'bcrypt-ruby'
gem 'pry'
gem 'dry-data'
gem 'slim'

gem 'dry-validation', github: 'dryrb/dry-validation', branch: 'master'
gem 'dry-component', github: 'dryrb/dry-component', branch: 'master'

group :rom do
  gem 'pg', platforms: [:mri, :rbx]
  gem 'pg_jruby', platforms: [:jruby]
  gem 'transproc', github: 'solnic/transproc', branch: 'master'
  gem 'rom', github: 'rom-rb/rom', branch: 'master'
  gem 'rom-repository', github: 'rom-rb/rom-repository', branch: 'master'
  gem 'rom-sql', github: 'rom-rb/rom-sql', branch: 'master'
  gem 'rom-support', github: 'rom-rb/rom-support', branch: 'master'
  gem 'rom-mapper', github: 'rom-rb/rom-mapper', branch: 'master'
end

group :test do
  gem 'byebug', platform: :mri
  gem 'rack-test'
  gem 'rspec'
  gem 'database_cleaner'
  gem 'capybara'
end
