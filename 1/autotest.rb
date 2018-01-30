require "Watir"
require "RSpec"
require "./page_objects/Login.rb"
require "./page_objects/SiteSettings.rb"
require "./page_objects/MyWebsites.rb"
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
# open_site_settings(b, 1)
# expect(get_title(b)).to eql("Manage general settings")
# site_name = get_site_name_from_banner(b)
# set_save_site_name(b, site_name + "_test")
# expect(get_site_name_from_banner(b)).to eql(site_name + "_test")
# goto_my_websites(b)
# expect(check_site_name(b)).to eql(site_name + "_test")
# open_site_settings(b, 1)
# set_save_site_name(b, site_name)
# expect(get_site_name_from_banner(b)).to eql(site_name)
# b.close

#rename clases
#rename variables page_login -> login_page
b = Watir::Browser.new :chrome
login_page = LoginPage.new(b)
login_page.goto('https://weblium.com/')
expect(b.url).to eql("https://weblium.com/")
login_page.goto_login_page
expect(login_page.get_title).to eql("Log in")
login_page.login("weblium1@gmail.com", 123124)
expect(login_page.get_login_error_text).to eql("Invalid email or password")
sitesettings_page = login_page.successful_login("weblium1@gmail.com", 123123)
                              .open_site_settings(1)
expect(sitesettings_page.get_title).to eql("Manage general settings")
site_name = sitesettings_page.get_site_name_from_banner
sitesettings_page.set_save_site_name(site_name + "_test")
expect(sitesettings_page.get_site_name_from_banner).to eql(site_name + "_test")
myaccount_page = sitesettings_page.goto_my_websites
expect(myaccount_page.check_site_name).to eql(site_name + "_test")
myaccount_page.open_site_settings(1)
sitesettings_page.set_save_site_name(site_name)
expect(sitesettings_page.get_site_name_from_banner).to eql(site_name)
b.close