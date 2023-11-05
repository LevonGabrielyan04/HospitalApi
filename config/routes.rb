Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
# config/routes.rb
post '/consultation_requests', to: 'main_controller#create_consultation'
post '/consultation_requests/:request_id/recommendations', to: 'recommendations#create_recomendation'
get '/patients/:patient_id/recommendations', to: 'recommendations#find_recomendations'

  # Defines the root path route ("/")
  # root "posts#index"
end
