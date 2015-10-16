Rails.application.routes.draw do

  get 'releases/index'

  get 'releases/show'

  get 'collections/index'

  get 'collections/show'

  get 'stylings/index'

  get 'stylings/show'

  get 'interiors/index'

  get 'interiors/show'

  resources :stylings, only: [:show, :index] do
    collection do
      get "lookbooks"
      get "performances"
      get "personal"
    end
  end
  resources :interiors, only: [:show, :index] do
  end
  resources :collections, only: [:show, :index] do
  end
  resources :releases, only: [:show, :index] do
  end

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
end
