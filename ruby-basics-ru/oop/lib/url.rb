# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  include Comparable
  extend Forwardable

  attr_reader :query_params

  def initialize(uri)
    @uri          = URI(uri)
    @query_params = @uri.query ? URI.decode_www_form(@uri.query).to_h.transform_keys(&:to_sym) : {}
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_param(key, default = nil)
    @query_params.fetch(key, default)
  end

  def <=>(other)
    is_equal = scheme == other.scheme
    is_equal &&= host == other.host
    is_equal &&= port == other.port
    is_equal &&= query_params == other.query_params
    is_equal ? 0 : 1
  end
end
# END
