Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end

  resources :tags
  resources :authors

  root to: 'articles#index'
end
