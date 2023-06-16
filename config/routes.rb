Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :authors
      resources :resources
      resources :articles do
        resources :comments
      end
    end
  end

  #resources :articles
  #resources :comments
  #resources :articles, only: [:index, :show, :create, :update]

end
