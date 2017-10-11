Rails.application.routes.draw do
  resources :feeders
  resources :tanks
  resources :sensor_records
  resources :sensors do
    collection do
      get 'generate_random_data/:id/:number_of_items', :to => "sensors#generate_random_data"
    end
  end
  resources :lots
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
