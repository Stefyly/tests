require "Watir"
require "RSpec"
require "../page_objects/Login.rb"
require "../page_objects/SiteSettings.rb"
require "../page_objects/MyWebsites.rb"


describe MywebsitesPage do
    before :each do
            @b = Watir::Browser.new :chrome
            @login_page = LoginPage.new(@b)
            @b.goto('https://weblium.com/')
            @login_page.goto_login_page
            @sitesettings_page = @login_page.successful_login("weblium1@gmail.com", 123123).open_site_settings(1)
            
    end

    after :each do
        @b.close
    end
    
    it "hover prewiev and go to site settings" do
        p "aa"
        #@sitesettings_page = @sitesettings_page.open_site_settings(1)
        expect(@sitesettings_page.get_title).to eql("Manage general settings")
    end
    
    it "change site name" do
        site_name = @sitesettings_page.get_site_name_from_banner
        @sitesettings_page.set_save_site_name(site_name + "_test")
        expect(@sitesettings_page.get_site_name_from_banner).to eql(site_name + "_test")
        myaccount_page = @sitesettings_page.goto_my_websites
        expect(myaccount_page.check_site_name).to eql(site_name + "_test")
        myaccount_page.open_site_settings(1)
        @sitesettings_page.set_save_site_name(site_name)
        expect(@sitesettings_page.get_site_name_from_banner).to eql(site_name)
    end

    # it "checking site name in my websites" do
    #     @site_name = @sitesettings_page.get_site_name_from_banner()
    #     @myaccount_page = @sitesettings_page.goto_my_websites()
    #     expect(@myaccount_page.check_site_name).to eql(@site_name + "_test")
    # end
end

    

