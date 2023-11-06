Rails.application.routes.draw do
  get 'patients/:patient_id/recommendations', to: 'recommendations#index'
  post 'consultation_requests/:request_id/recommendations', to: 'recommendations#create'
  post 'consultation_requests', to: 'consultation_requests#create'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
