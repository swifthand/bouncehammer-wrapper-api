module BounceHammerAPI
  class App < Sinatra::Application

    configure do
      disable :method_override
      disable :static

      # Really basic/simple Sinatra session settings:
      set :sessions,  httponly:     true,
                      expire_after: 31557600, # aka one year
                      secure:       production?,
                      secret:       ENV['SINATRA_SESSION_SECRET']
    end

    use Rack::Deflater

  end
end
