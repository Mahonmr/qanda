Rails.application.routes.draw do
  resources :event_types
  resources :events
  scope "events/:event_id" do
    resources :event_steps
  end

  root 'events#index'

end
