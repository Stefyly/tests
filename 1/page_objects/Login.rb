class LoginPage

    def initialize(driver)
        @b = driver
        @login_button_on_main_page = "[href='https://weblium.com/login']"
        @title                     = ".title"
        @email_field               = "#id5"
        @pass_field                = "#id9"
        @login_button              = "[type='submit']"
        @login_error_text          = "[data-test='sig-in-error']"   
    end

    #def resize_to(width, height)
        

    def goto(url)
        @b.goto(url)
        self
    end

    def goto_login_page()
        @b.element(css: @login_button_on_main_page).click
        self
    end

    def get_title()
        @b.element(css: @title).text
    end

    def login(email, pass)
        set_email(email)
        set_pass(pass)
        click_login_button()
        self
    end

    def successful_login(email, pass)
        set_email(email)
        set_pass(pass)
        click_login_button()
        MywebsitesPage.new(@b)
    end

    def set_email(email)
        @b.text_field(css: @email_field).set(email)
        self
    end

    def set_pass(pass)
        @b.text_field(css: @pass_field).set(pass)
        self
    end

    def click_login_button()
        @b.element(css: @login_button).click
        self
    end

    def get_login_error_text()
        @b.element(css: @login_error_text).wait_until_present.text
    end
end