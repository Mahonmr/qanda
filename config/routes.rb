Rails.application.routes.draw do
  resources :event_types
  resources :clubs do
    resources :events
      scope "events/:event_id" do
        resources :event_steps
      end
  end

  root 'clubs#index'

end
