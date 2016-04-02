Comments::Engine.routes.draw do
  resources :comments, path: '' do
    member do
      get :reply
    end
  end
end
