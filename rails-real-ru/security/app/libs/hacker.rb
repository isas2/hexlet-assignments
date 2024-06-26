# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'net/https'

class Hacker
  class << self
    def hack(email, password)
      uri = URI('https://rails-collective-blog-ru.hexlet.app/users/sign_up')
      Net::HTTP.start(uri.host, uri.port,
                      use_ssl: uri.scheme == 'https',
                      verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request

        cookie = response.response['set-cookie'].split('; ')[0]
        html = Nokogiri::HTML(response.body)

        token_tag = html.at("input[@name='authenticity_token']")
        params = {
          'user[email]': email,
          'user[password]': password,
          'user[password_confirmation]': password,
          'authenticity_token': token_tag['value'],
          'commit':	'Регистрация'
        }

        uri.path = '/users'
        request = Net::HTTP::Post.new uri
        request.body = URI.encode_www_form(params)
        request['Cookie'] = cookie
        response = http.request request

        %w[302 303].include?(response.code)
      end
    end
  end
end
