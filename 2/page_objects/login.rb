class LoginPage
    
    def initialize(driver)
        @b = driver
        @login_button_main_page = "[href='https://weblium.com/login']"
        @email_field = "#id5"
        @pass_field = "#id9"
        @login_button = "[type='submit']"
        @title = ".title"
    end

    def goto(url)
        @b.goto(url)
    end                                             #why method doesnot return class object

    def open_login_page
        @b.element(css: @login_button_main_page).click
        self
    end

    def login(login, pass)
        @b.text_field(css: @email_field).set(login)
        @b.text_field(css: @pass_field).set(pass)
        @b.element(css: @login_button).click
    end

    def get_title
        @b.element(css: "#app").wait_until_present
        @b.element(css: @title).text
    end

end

    




