class MyProfilePage
    
    def initialize(driver)
        @b = driver
        @my_profile_link = ".user-profile-ico"
        @change_pass_link = ".text-list__item_md"

    end

    def open_my_profile
        @b.element(css: @my_profile_link).click
        MyProfilePage.new(@b)
    end

    def open_change_pass
        @b.element(css: @change_pass_link).click
    end

end
