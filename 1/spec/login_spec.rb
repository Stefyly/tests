require '../page_objects/Login.rb'
require "../page_objects/SiteSettings.rb"
require "../page_objects/MyWebsites.rb"
require "Watir"
require "RSpec"

describe LoginPage do
    before :each do
            @b = Watir::Browser.new :chrome
            @login_page = LoginPage.new(@b)
            @b.goto('https://weblium.com/')
            expect(@b.url).to eql("https://weblium.com/")
            @login_page.goto_login_page
    end

    after :each do
        @b.close
    end

    it "go to login page" do
        #@b.window.resize_to(1300, 800)
        expect(@login_page.get_title).to eql("Log in")
    end

    it "login with wrong pass" do
        @login_page.login("weblium1@gmail.com", 123124)
        expect(@login_page.get_login_error_text).to eql("Invalid email or password")
    end

    it "successful_login" do
        @login_page.successful_login("weblium1@gmail.com", 123123)
    end

end