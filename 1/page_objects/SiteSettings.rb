class SitesettingsPage

    def initialize(driver)
        @b = driver
        @title = ".title"
        @site_name_from_banner = ".banner-tab__site"
        @site_name_field       = "#site"
        @save_site_name        = "[title='Save changes']"
        @changes_saved_text    = "[data-test='Changes saved']"
        @my_websites_button    = ".browser-ico"

    end

    def get_title()
        @b.element(css: @title).text
    end

    def get_site_name_from_banner()
        @b.element(css: @site_name_from_banner).wait_until_present.text
    end

    def set_save_site_name(sitename)
        set_site_name(sitename)
        save_site_name()
        wait_changes_saved()
        self
    end

    def set_site_name(sitename)
        @b.text_field(css: @site_name_field).set(sitename)
        self
    end

    def save_site_name()
        @b.element(css: @save_site_name).click
        self
    end

    def wait_changes_saved()
        @b.element(css: @changes_saved_text).wait_until_present
        self
    end

    def goto_my_websites()
        @b.element(css: @my_websites_button).click
        MywebsitesPage.new(@b)
    end
end