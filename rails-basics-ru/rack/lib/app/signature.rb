# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN    
    status, headers, body = @app.call(env)
    [status, headers, body << "\n#{Digest::SHA256.hexdigest(body.first)}"]
    # END
  end
end
