Given /^I am not (?:signed|logged) in$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, '/admin/logout', {}
  ensure
    Capybara.current_driver = current_driver
  end
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |hash|
    User.create!(hash)
  end
end