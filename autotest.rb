require "Watir"
require "RSpec"
require_relative "funcLogin.rb"
require_relative "funcSitesettings.rb"
require_relative "funcMywebsites.rb"
include ::RSpec::Matchers

#Brows.new.ss(1)
# bmw = Car.new

# bmw.set("ff")

# p bmw.get

# b = Watir::Browser.new :chrome
# goto(b, "weblium.com")
# expect(b.url).to eql("https://weblium.com/")
# goto_login_page(b)
# expect(get_title(b)).to eql("Log in")
# login(b, "weblium1@gmail.com", 123124)
# expect(get_login_error_text(b)).to eql("Invalid email or password")
# set_pass(b, 123123)
# click_login_button(b)
# hover_goto_site_settings(b, 1)
# expect(get_title(b)).to eql("Manage general settings")
# site_name = get_site_name_from_banner(b)
# set_save_site_name(b, site_name + "_test")
# expect(get_site_name_from_banner(b)).to eql(site_name + "_test")
# goto_my_websites(b)
# expect(check_site_name(b)).to eql(site_name + "_test")
# hover_goto_site_settings(b, 1)
# set_save_site_name(b, site_name)
# expect(get_site_name_from_banner(b)).to eql(site_name)
# b.close
b = Watir::Browser.new :chrome
page_login = PageLogin.new(b)
page_login.goto('https://weblium.com/')
expect(b.url).to eql("https://weblium.com/")
page_login.goto_login_page
expect(page_login.get_title).to eql("Log in")
page_login.login("weblium1@gmail.com", 123124)
expect(page_login.get_login_error_text).to eql("Invalid email or password")
page_login.successful_login("weblium1@gmail.com", 123123)
page_myaccount = PageMywebsites.new(b)
page_myaccount.hover_goto_site_settings(1)
page_sitesettings = PageSitesettings.new(b)
expect(page_sitesettings.get_title).to eql("Manage general settings")
site_name = page_sitesettings.get_site_name_from_banner()
page_sitesettings.set_save_site_name(site_name + "_test")
expect(page_sitesettings.get_site_name_from_banner).to eql(site_name + "_test")
page_sitesettings.goto_my_websites()
expect(page_myaccount.check_site_name).to eql(site_name + "_test")
page_myaccount.hover_goto_site_settings(1)
page_sitesettings.set_save_site_name(site_name)
expect(page_sitesettings.get_site_name_from_banner).to eql(site_name)
b.close