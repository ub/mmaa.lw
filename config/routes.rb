Rails.application.routes.draw do
  resources :meetup_events do
    resources :activity_applications
  end
  resources :users
  root  'meetup_events#root'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
