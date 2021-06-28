Rails.application.routes.draw do
  devise_for :users
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'courses#index'
  # get 'static_pages/landing_page'
  # get 'static_pages/privacy_policy'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
end
