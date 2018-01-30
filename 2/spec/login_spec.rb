# require "Watir"
# require "RSpec"
# require "../page_objects/login.rb"

# describe LoginPage do

#     before :each do
#         @b = Watir::Browser.new :chrome
#         @login_page = LoginPage.new(@b)
#         @b.goto("https://weblium.com")
#         expect(@b.url).to eql("https://weblium.com/")
#         @login_page.open_login_page
#     end

#     after :each do
#         @b.close
#     end

#     it "open login page" do
#         expect(@b.url).to eql("https://weblium.com/login")
#     end

#     it "login" do
#         @login_page.login("weblium1@gmail.com", "123123")
#         sleep 1
#         expect(@login_page.get_title).to eql("Your online presence is built here!")
#     end
    
# end

