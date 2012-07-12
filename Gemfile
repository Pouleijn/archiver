source 'https://rubygems.org'

# Specify your gem's dependencies in archiver.gemspec
gemspec

gem 'bundler'
gem 'rake'

group :development, :test do
  gem 'minitest'  
end
  
group :test do
  gem 'guard'
  gem 'guard-minitest', github: 'mpouleijn/guard-minitest'
  gem 'guard-bundler'
end