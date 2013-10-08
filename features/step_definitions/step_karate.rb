require 'watir-webdriver'

Given /^I navigate to Google$/ do
	@browser = Watir::Browser.new :ff
	@browser.goto "http://www.google.co.in"
end

When /^I enter (\w+) into the search field$/ do |searchPerson|
	searchField = @browser.text_field(:name, 'q')
	searchButton = @browser.button(:name, 'btnG')
	searchField.set searchPerson
	searchButton.click
end

Then /^the text (\w+) should be present$/ do |personSurname|
	@browser.div(:id => 'resultStats').wait_until_present
	(@browser.text.include? personSurname).should == true
	#@browser.close
end  