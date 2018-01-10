class SitesettingsPage

    def initialize(browser)
        @b = browser
    end

    def get_title()
        @b.element(css: ".title").text
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
        MywebsitesPage.new(@b)
    end

end