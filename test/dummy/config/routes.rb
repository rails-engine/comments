Rails.application.routes.draw do
  resources :topics
  devise_for :users
  mount Comments::Engine => "/comments"
  root to: 'welcome#index'
end
