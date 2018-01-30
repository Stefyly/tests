class MywebsitesPage
    
    def initialize(driver)
        @b = driver
        @app                    = "#app"
        @website_preview        = ".img-wrp"
        @site_settings_button   = ".inline a"
        @website_name_preview   = ".page-view__name"
    end

    def wait_app()
        @b.element(css: @app).wait_until_present
        self
    end

    def open_site_settings(index)
        hover_preview(index)
        goto_site_settings(index)
        SitesettingsPage.new(@b)
    end

    def hover_preview(index)
        @b.element(css: @website_preview, index: index).hover
        self
    end

    def goto_site_settings(index)
        @b.element(css: @site_settings_button, index: index).click
        self
    end

    def check_site_name()
        @b.element(css: @website_name_preview, index: 1).text
    end

end