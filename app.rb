class App

  def call(env)
    request = Rack::Request.new(env)
    path = request.path_info

    response = Rack::Response.new([], 200, { 'Content-Type' => 'text/plain' })

    if path == '/time'
      timeformat = TimeFormated.new(request.params)
      body = timeformat.time_format
      response.status = timeformat.status
      response.write body
    else
      response.status = 404
      response.write "Not Found: #{path}"
    end

    response.finish
  end

end
