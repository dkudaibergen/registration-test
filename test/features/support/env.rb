require 'selenium-webdriver'
require 'capybara'
require 'capybara/email'

def driver
    return @driver if @driver

    # chrome_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    # client = Selenium::WebDriver::Remote::Http::Default.new
    # client.read_timeout = 300
    # @driver = Selenium::WebDriver.for :remote, url: "http://selenium:4444/wd/hub", capabilities: chrome_capabilities, http_client: client
    @driver = Selenium::WebDriver.for :chrome

    @driver
end

def driver2
    return @driver2 if @driver2

    @driver2 = Selenium::WebDriver.for :chrome
    # @driver2.manage.window.maximize

    @driver2
end