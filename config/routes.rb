Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "user/sessions" }
  resources :event_types
  resources :clubs do
    resources :events
      scope "events/:event_id" do
        resources :event_steps
      end
  end

  root 'clubs#index'

end
