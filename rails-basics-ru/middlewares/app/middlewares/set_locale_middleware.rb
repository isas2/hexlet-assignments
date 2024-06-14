# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    if request.env['HTTP_ACCEPT_LANGUAGE']
      locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      I18n.locale = if I18n.available_locales.include?(locale.to_sym)
                      locale
                    else
                      I18n.default_locale
                    end
    end
    @app.call(env)
  end
end
