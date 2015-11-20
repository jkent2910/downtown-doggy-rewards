Given /^I am not signed in$/ do
  step "I sign out"
end

Given /^I am signed in$/ do
  step "I sign in"
end

When /^I sign in$/ do
  step "I sign in using \"password\""
end

When /^I sign in using "([^"]*)"$/ do |password|
  step "I am on sign in page"
  step "I should see \"Sign up\""
  step "I fill in \"admin[email]\" with \"#{@admin.email}\""
  step "I fill in \"admin[password]\" with \"#{password}\""
  step "I press \"Sign in\""
  @admin.save!
end

When /^I sign out$/ do
  visit destroy_admin_session_path
end