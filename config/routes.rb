Rails.application.routes.draw do
  resources :event_types
  #resources :events

  get  "events/step1", to: 'events#step1'
  get  "events/step2", to: 'events#step2'
  get  "events/step3", to: 'events#step3'
  get  "events/step4", to: 'events#step4'
  post  "events/step5", to: 'events#step5'

  root 'events#index'

end
