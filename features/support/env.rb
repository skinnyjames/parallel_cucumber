require 'rspec'
require 'page-object'
require 'data_magic'
require 'watir'
require 'cucumber'

World(PageObject::PageFactory)

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities.browser_name = :chrome

#browser = Watir::Browser.new(
#    :remote,
#    :url => ENV['IP'],
#    :desired_capabilities => capabilities
#)

browser = Watir::Browser.new(:remote, url: "#{ENV['IP']}/wd/hub", desired_capabilities: capabilities)


Before do
  @browser = browser
end



at_exit do
  browser.quit
end




# To run with new grid IP, run bundle exec parallel_cucumber features/ -o IP=http://<ip>:4444/wd/hub
