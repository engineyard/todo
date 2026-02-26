Rails.application.routes.draw do
  resources :lists, only: [:create, :destroy] do
    resources :tasks, except: [:new, :edit, :show]
  end

  get 'environment', to: 'environment#index'

  root "tasks#index"
end
