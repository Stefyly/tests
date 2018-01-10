class PageLogin

    def initialize(browser)
        @b = browser
    end

    def goto(url)
        @b.goto(url)
        self
    end

    def goto_login_page()
        @b.element(css: "[href='https://weblium.com/login']").click
        self
    end

    def get_title()
        @b.element(css: ".title").text
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
        PageMywebsites.new(@b)
    end

    def set_email(email)
        @b.text_field(css: "#id5").set(email)
        self
    end

    def set_pass(pass)
        @b.text_field(css: "#id9").set(pass)
        self
    end

    def click_login_button()
        @b.element(css: "[type='submit']").click
        self
    end

    def get_login_error_text()
        @b.element(css: "[data-test='sig-in-error']").wait_until_present.text
    end

end