source 'https://rubygems.org'

# Versions can be overridden with environment variables for matrix testing.
# Travis will remove Gemfile.lock before installing deps.

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet'
gem 'rspec-system-puppet'
gem 'puppetlabs_spec_helper'
gem 'puppet-syntax'

if puppetversion = ENV['PUPPET_GEM_VERSION']
    gem 'puppet', puppetversion, :require => false
else
    gem 'puppet', :require => false
end
