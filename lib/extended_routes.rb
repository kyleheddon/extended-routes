class ExtendedRoutes
  class << self

    def init(routes)
      @@routes = routes
    end

    def get(application, path, options = {})
      options.merge!({ to: redirect(application, path) })
      routes.get path, options
    end

    def base_urls=(urls)
      @@base_urls = {}
      urls.each do |app, base|
        @@base_urls[app.to_s] = base.sub(/\/\z/, '')
      end
      @@base_urls
    end

    def base_url(app)
      @@base_urls[app.to_s]
    end

    private

    def redirect(application, path)
      routes.redirect { url(application, path) }
    end

    def url(app, path)
      (base_url(app) + "/#{path}/".gsub('//', '/')).sub(/\/\/\z/, '/')
    end

    def routes
      @@routes
    end

  end
end