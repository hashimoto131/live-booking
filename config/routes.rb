Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'articles#index'
  resources :messages, only: [:index, :show, :create] do
    collection do
    	get 'inbox'
			get 'outbox'
    end
	end


  resources :articles do
  	resources :messages, only: :create
    collection do
      get 'search'
    end
  end
end
