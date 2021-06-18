Rails.application.routes.draw do
  namespace :patients_backoffice do
    get 'dashboard/index'
  end
  namespace :doctors_backoffice do
    get 'dashboard/index'
  end
  resources :appointments, only: %i[index edit new update]

  namespace :patients_backoffice do
    resources :patients
  end
  namespace :doctors_backoffice do
    resources :doctors
  end
  devise_for :patients
  devise_for :doctors
  get 'welcome/index'

  root to: 'doctors_backoffice/dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
