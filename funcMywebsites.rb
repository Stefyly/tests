class PageMywebsites
    
    def initialize(browser)
        @b = browser
    end

    def wait_app()
        @b.element(css: "#app").wait_until_present
        self
    end

    def hover_goto_site_settings(index)
        hover_preview(index)
        @b.element(css: ".inline a", index: index).click
        PageSitesettings.new(@b)
    end

    def hover_preview(index)
        @b.element(css: ".img-wrp", index: index).hover
        self
    end

    def goto_site_settings(index)
        @b.element(css: ".inline a", index: index).click
        self
    end

    def check_site_name()
        @b.element(css: ".page-view__name", index: 1).text
    end

end