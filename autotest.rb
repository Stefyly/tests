require "Watir"
require "RSpec"
require_relative "func.rb"
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
page = Browse.new(b)
page.goto('https://weblium.com/')
expect(b.url).to eql("https://weblium.com/")
page.goto_login_page
expect(page.get_title).to eql("Log in")
page.login("weblium1@gmail.com", 123124)
expect(page.get_login_error_text).to eql("Invalid email or password")
page.set_pass(123123)
    .click_login_button()
    .hover_goto_site_settings(1)
expect(page.get_title).to eql("Manage general settings")
site_name = page.get_site_name_from_banner()
page.set_save_site_name(site_name + "_test")
expect(page.get_site_name_from_banner).to eql(site_name + "_test")
page.goto_my_websites()
expect(page.check_site_name).to eql(site_name + "_test")
page.hover_goto_site_settings(1)
page.set_save_site_name(site_name)
expect(page.get_site_name_from_banner).to eql(site_name)
b.close