# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start_time = Time.now
    status, headers, body  = @app.call(env)
    total_time = "\nExecution time: #{(1000 * (Time.now - start_time))}\n"
    [status, headers, body << total_time]
    # END
  end
end
