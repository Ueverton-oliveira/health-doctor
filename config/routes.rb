Rails.application.routes.draw do
  resources :appointments, only: %i[index edit new]
  resources :dashboard, only: [:index]

  namespace :patients_backoffice do
    resources :patients
  end
  namespace :doctors_backoffice do
    resources :doctors
  end
  devise_for :patients
  devise_for :doctors
  get 'welcome/index'

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
