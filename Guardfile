guard("rspec", :all_after_pass => false, :cli => "--color") do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^(.+)\.rb$}) {|match| "spec/#{match[1]}_spec.rb"}
end