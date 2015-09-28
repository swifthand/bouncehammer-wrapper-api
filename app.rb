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
      set :server, :puma
    end

    use Rack::Deflater


    get '/data/recent/:number/?:unit' do
      content_type :json
      DataDumper.new({
        'howrecent' => "#{params['number']}#{params['unit'] || ''}"
      }).results
    end


    get '/data/*' do
      content_type :json
      converter = ConvertsArgFormat.new(DataDumperOptions.new)
      args_hash = converter.splat_to_hash(params[:splat])
      DataDumper.new(args_hash).results
    end

  end
end
