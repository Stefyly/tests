# require "Watir"
# require "RSpec"
# require "../page_objects/Login.rb"
# require "../page_objects/SiteSettings.rb"
# require "../page_objects/MyWebsites.rb"

# describe MywebsitesPage do

#     before :each do
#         @b = Watir::Browser.new :chrome
#         @login_page = LoginPage.new(@b)
#         @login_in_system = @login_page.goto('https://weblium.com/')
#                                       .goto_login_page
#         @sitesettings_page = @login_page.successful_login("weblium1@gmail.com", 123123)
        
#         #@sitesettings_page = MywebsitesPage.new(@b)
#         @sitesettings_page = @sitesettings_page.open_site_settings(1)
#         @site_name = @sitesettings_page.get_site_name_from_banner()
#         @myaccount_page = @sitesettings_page.goto_my_websites()
#     end

#     it "check site name in on my websits" do
#         expect(@myaccount_page.check_site_name).to eql(@site_name)
#     end
# end


