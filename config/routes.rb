Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :event_types
  resources :clubs do
    resources :events
      scope "/events/:event_id" do
        resources :event_steps
      end
  end

  resources :admins, only: [] do
    resources :clubs, controller: :admin_clubs
  end

  resources :managers, only: [] do
    resources :clubs, controller: :manager_clubs
  end

  resources :athletes, only: [] do
    resources :events, controller: :athlete_events
  end

  # resources :athletes, only: [] do
  #   resources :events, controller: :athlete_events
  # end

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  get "home/admin", as: "admin_home"
  get "home/manager", as: 'manager_home'
  get "home/athlete", as: 'athlete_home'

  root :to => 'home#index'
end
