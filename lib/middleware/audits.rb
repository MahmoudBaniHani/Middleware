require 'logger'
class AuditMiddleware
  def initialize(app)
    @app = app
  end


  def call (env)
    @status, @headers, @response = @app.call(env)
    request_started_on = Time.now
    request_ended_on = Time.now
    browser = env['HTTP_USER_AGENT'].split(')')[2]
    ip_address = env['HTTP_HOST']
    location = Geocoder.search(env['REMOTE_ADDR'].to_i)
    # puts "Start Time:[#{request_started_on}],Browser: [#{browser}],IP Address: [#{ip_address}],Location [#{location.first.country}],End Time [#{request_ended_on}]"
    logger = Rails.logger
    logger.info("================================== Middleware =================================")
    logger.info("Start Time:[#{request_started_on}] \nBrowser:\t[#{browser}]\nIP Address:\t[#{ip_address}]\nLocation:\t[#{location.first.country}]\nEnd Time:\t[#{request_ended_on}]\nRequest time:\t#{request_ended_on - request_started_on} seconds.")
    logger.info("========================= By Mahmoud Basim Bani-Hani===========================")



    [@status, @headers, @response]

  end
end