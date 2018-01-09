# class Car
#     def initialize
#         @browser
#     end

#     def set(gf)
#         @browser.element
#         @number_of_smth = gf
#     end

#     def get
#         return @number_of_smth
#     end
# end
class Browse

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

    def wait_app()
        @b.element(css: "#app").wait_until_present
        self
    end

    def hover_goto_site_settings(index)
        hover_preview(index)
        @b.element(css: ".inline a", index: index).click
        self
    end

    def hover_preview(index)
        @b.element(css: ".img-wrp", index: index).hover
        self
    end

    def goto_site_settings(index)
        @b.element(css: ".inline a", index: index).click
        self
    end

    def get_site_name_from_banner()
        @b.element(css: ".banner-tab__site").wait_until_present.text
    end

    def set_save_site_name(sitename)
        set_site_name(sitename)
        save_site_name()
        wait_changes_saved()
        self
    end

    def set_site_name(sitename)
        @b.text_field(css: "#site").set(sitename)
        self
    end

    def save_site_name()
        @b.element(css: "[title='Save changes']").click
        self
    end

    def wait_changes_saved()
        @b.element(css: "[data-test='Changes saved']").wait_until_present
        self
    end

    def goto_my_websites()
        @b.element(css: ".browser-ico").click
        self
    end

    def check_site_name()
        @b.element(css: ".page-view__name", index: 1).text
    end
end

# def goto(b, url)
#     b.goto(url)
# end

# def goto_login_page(b)
#     b.element(css: "[href='https://weblium.com/login']").click
# end

# def get_title(b)
#     b.element(css: ".title").text
# end

# def login(b, email, pass)
#     set_email(b, email)
#     set_pass(b, pass)
#     click_login_button(b)
# end

# def set_email(b, email)
#     b.text_field(css: "#id5").set(email)
# end

# def set_pass(b, pass)
#     b.text_field(css: "#id9").set(pass)
# end

# def click_login_button(b)
#     b.element(css: "[type='submit']").click
# end

# def get_login_error_text(b)
#     b.element(css: "[data-test='sig-in-error']").wait_until_present.text
# end

# def wait_app(b)
#     b.element(css: "#app").wait_until_present
# end

# def hover_goto_site_settings(b, index)
#     hover_preview(b, index)
#     b.element(css: ".inline a", index: index).click
# end

# def hover_preview(b, index)
#     b.element(css: ".img-wrp", index: index).hover
# end

# def goto_site_settings(b, index)
#     b.element(css: ".inline a", index: index).click
# end

# def get_site_name_from_banner(b)
#     b.element(css: ".banner-tab__site").wait_until_present.text
# end

# def set_save_site_name(b, sitename)
#     set_site_name(b, sitename)
#     save_site_name(b)
#     wait_changes_saved(b)
# end

# def set_site_name(b, sitename)
#     b.text_field(css: "#site").set(sitename)
# end

# def save_site_name(b)
#     b.element(css: "[title='Save changes']").click
# end

# def wait_changes_saved(b)
#     b.element(css: "[data-test='Changes saved']").wait_until_present
# end

# def goto_my_websites(b)
#     b.element(css: ".browser-ico").click
# end

# def check_site_name(b)
#     b.element(css: ".page-view__name", index: 1).text
# end







