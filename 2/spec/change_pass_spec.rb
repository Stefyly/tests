require 'Watir'
require 'RSpec'
require 'rest-client'
require 'json'
require '../page_objects/login.rb'
require '../page_objects/my_profile.rb'
require '../page_objects/change_pass.rb'
require '../page_objects/api.rb'

describe ChangePassPage do
    before :each do
        @b = Watir::Browser.new :chrome
        @login_page = LoginPage.new(@b)
        @myprofile_page = MyProfilePage.new(@b)
        @change_pass_page = ChangePassPage.new(@b)
        @api = API.new
        @b.goto('https://weblium.co')
        expect(@b.url).to eql('https://weblium.co/')
        #@login_page.open_login_page
        #hack 
        @b.goto('https://weblium.co/login')
        
    end

    after :each do
        @b.close
    end

    it 'change pass' do
        @login_page.login('Test_S@weblium.com', '123123')
        @myprofile_page.open_my_profile
                       .open_change_pass
        @change_pass_page.change_pass_valid_data(123123, 123124, 123124)
        expect(@change_pass_page.get_changes_saved).to eql('Changes saved')
        @change_pass_page.close_change_pass_window
                         .logout
        expect(@b.url).to eql('https://weblium.co/login')
        #'login with api' do
        code, response = @api.call_api('Test_S@weblium.com', '123124')  
        expect(code).to eql(200)
        expect(response['data']['username']).to eql('test_s@weblium.com')
        #'change pass to first version'
        @login_page.login('Test_S@weblium.com', '123124') 
        @myprofile_page.open_my_profile
                       .open_change_pass
        @change_pass_page.change_pass_valid_data(123124, 123123, 123123)
        code, response = @api.call_api('Test_S@weblium.com', '123123') 
        expect(code).to eql(200)
        expect(response['data']['username']).to eql('test_s@weblium.com')
    end

end