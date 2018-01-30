class ChangePassPage
    def initialize(driver)
        @b = driver
        @old_pass = '#old-pswd'
        @new_pass = '#new-pswd'
        @confirm_pass = "#new-pswd-confirm"
        @change_pass_button = '[data-test="Change password"]'
        @changes_saved = '[data-test="Change password"]'
        @close_change_pass_window = ".window__close > button"
        @menu = ".menu__item_user"
        @logout = '[data-test="Logout"]'
        @changes_saved_text = "[data-test='Changes saved']"
    end

    def change_pass_valid_data(old_pass, new_pass, pass)
        set_old_pass(old_pass)
        set_new_pass(new_pass)
        retype_pass(pass)
        click_change_pass
        #@b.element(css: @changes_saved).wait_until_present
        self
    end

    def set_old_pass(old_pass)
        @b.text_field(css: @old_pass).set(old_pass)
    end

    def set_new_pass(new_pass)
        @b.text_field(css: @new_pass).set(new_pass)
    end

    def retype_pass(pass)
        @b.text_field(css: @confirm_pass).set(pass)
    end

    def click_change_pass
        @b.element(css: @change_pass_button).click
    end

    def get_changes_saved #wait antil element text = saved
        #Watir::Wait.while { @b.element(text: @changes_saved).present? }
        #@b.element(text: @changes_saved).wait_until_present
        @b.element(css: @changes_saved_text).wait_until_present.text
    end

    def close_change_pass_window
        @b.element(css: @close_change_pass_window).fire_event :click
        self
    end

    def logout
        @b.element(css: @menu).hover
        @b.element(css: @logout).click
    end

end