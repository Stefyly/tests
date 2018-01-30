
# require "Watir"
# require "RSpec"
# require "../page_objects/my_profile.rb"
# require "../page_objects/login.rb"

# describe MyProfilePage do

#     before :each do
#         @b = Watir::Browser.new :chrome
#         @login_page = LoginPage.new(@b)
#         @myprofile_page = MyProfilePage.new(@b)
#         @b.goto("https://weblium.com")
#         expect(@b.url).to eql("https://weblium.com/")
#         @login_page.open_login_page
#         @login_page.login("weblium1@gmail.com", "123123")
#         @myprofile_page.open_my_profile
#     end

#     after :each do
#         @b.close
#     end

#     it "open my profile" do
        
#         expect(@b.url).to eql("https://weblium.com/myaccount/profile")
#     end

#     it "open change pass" do
#         @myprofile_page.open_change_pass
#     end


# end

