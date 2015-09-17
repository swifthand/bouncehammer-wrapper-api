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


    get '/data/recent/:number/?:unit' do
      content_type :json
      DataDumper.new({
        'howrecent' => "#{params['number']}#{params['unit'] || ''}"
      }).results
    end


    get '/data/*' do
      args = ArgConvert.from_splat(params[:splat], values: DataDumper.value_args,  flags: DataDumper.flag_args)
      DataDumper(args.to_h).results
    end

  end
end
