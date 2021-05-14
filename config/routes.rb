Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :memos, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end
end
