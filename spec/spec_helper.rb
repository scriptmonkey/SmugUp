#require 'webmock/rspec'
#require 'vcr'

#Rspec.configure.extend VCR::RSpec::Macros

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/cassette_library'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :none }
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
