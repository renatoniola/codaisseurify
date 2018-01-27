Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists , only: [ :index , :show ,:destroy , :new, :create] do

    resources :songs , only: [:destroy, :create]
  end

  namespace :api do
      resources :artists , only: [ :index , :show ,:destroy , :new, :create] do

      resources :songs , only: [:destroy, :create]
    end
  end

  root to: 'artists#index'
end
