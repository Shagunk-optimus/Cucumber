require 'watir-webdriver'
iframe="http://www.testalways.com/cgi-bin/triangle/main.cgi"

Given /^I navigate to the site$/ do
	@browser = Watir::Browser.new :ff
	@browser.goto "http://test1.testalways.com/cgi-bin/triangle/TestTriangle.html"
end

When /^I enter sides into the side text-field$/ do 
	@browser.frame(:src => 'test.html').frame(:src => iframe).text_field(:name, 'AB').set '7'
	@browser.frame(:src => 'test.html').frame(:src => iframe).text_field(:name, 'BC').set '7'
	@browser.frame(:src => 'test.html').frame(:src => iframe).text_field(:name, 'AC').set '7'
	
	@browser.frame(:src => 'test.html').frame(:src => iframe).button(:value, 'Enter').click
	
end

Then /^specific text should be present$/ do 
	@browser.frame(:src => 'test.html').frame(:src => iframe).wait_until_present
	(@browser.frame(:src => 'test.html').frame(:src => iframe).include? 'Triangle is equilateral' ).should == true
	#@browser.close
end  

