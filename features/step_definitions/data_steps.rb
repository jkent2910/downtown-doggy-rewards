Given(/^the following customers?:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:customer, hash)
  end
end