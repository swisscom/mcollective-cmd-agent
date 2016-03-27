#!ruby
source 'https://rubygems.org'

group :test do
  if RUBY_VERSION.to_f > 1.8
    gem 'rake'
  else
    gem 'rake', '< 11'
  end
  gem 'rspec', '~> 2.11.0'
  gem 'mocha', '~> 0.10.0'
  gem 'mcollective-test'
end

mcollective_version = ENV['MCOLLECTIVE_GEM_VERSION']

if mcollective_version
  gem 'mcollective-client', mcollective_version, :require => false
else
  gem 'mcollective-client', :require => false
end

platforms :ruby_18 do
  gem 'posix-spawn'
  gem 'uuid'
  gem 'i18n', ' ~> 0.6.0' if mcollective_version == '~> 2.4.0'
end
