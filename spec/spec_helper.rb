require 'webmock/rspec'
require 'vcr'

#Rspec.configure.extend VCR::RSpec::Macros

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
