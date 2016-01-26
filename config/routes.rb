Rails.application.routes.draw do
  root 'groups#index'

  get "not_signed_in" => "pages#not_signed_in"

  resources :sessions, only: :create
  resources :groups, only: :show
end
