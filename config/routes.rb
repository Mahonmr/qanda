Rails.application.routes.draw do
  devise_for :users
  resources :event_types
  resources :clubs do
    resources :events
      scope "/events/:event_id" do
        resources :event_steps
      end
  end

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  get "home/admin", as: "admin_home"
  get "home/manager", as: 'manager_home'
  get "home/athlete", as: 'athlete_home'

  root :to => 'home#index'
end
