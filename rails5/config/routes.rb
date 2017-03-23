Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :topics do
    collection do
      post :preview
    end
  end

  get 'notice' => 'notice#index'

  root to: "topics#index"
end
