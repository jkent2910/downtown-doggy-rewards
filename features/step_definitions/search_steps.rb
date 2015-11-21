When(/^I search for "(.*?)"$/) do |query|
  within("form[role=search]", match: :first) do 
    fill_in(:query, with: query)
    click_button("Go")
  end
end

Then(/^I should see the following customers$/) do |table|
  customer_results = find("#customer-search-results")
  table.hashes.each do |customer| 
    expect(customer_results).to have_text(customer[:first_name])
  end
end
