Rails.application.routes.draw do
  resources :cluster_metrics
  resources :cluster_counters
  resources :cluster_counter_types
  resources :clusters
  resources :fish_types
  resources :consumptions
  resources :sensor_errors
  resources :feeders
  resources :tanks do
    collection do
      post 'register_transation/:id/:code/:quantity', :to => 'tanks#register_transation'
    end
  end
  resources :sensor_records
  resources :sensors do
    collection do
      get 'generate_random_data/:id/:number_of_items', :to => "sensors#generate_random_data"
      get 'formated_records_data/:id', :to => "sensors#formated_data"
    end
  end
  resources :lots
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
