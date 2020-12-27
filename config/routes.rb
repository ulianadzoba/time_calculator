TimeCalculator::Engine.routes.draw do
  get '/calculator', to: 'calculator#show'
  post '/calculator', to: 'calculator#create'
  
  Rails.application.routes.draw do
    begin
      mount TimeCalculator::Engine => TimeCalculator.mount_at, as: "time_calculator"
    rescue ArgumentError
    end
  end
end
