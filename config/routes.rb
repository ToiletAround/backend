Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :toilets do
        resources :prices
        resources :locations
        resources :resources
        resources :schedules
      end
    end
  end
end
