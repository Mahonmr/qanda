Rails.application.routes.draw do
  resources :event_types
  resources :events

  root 'events#index'
end
