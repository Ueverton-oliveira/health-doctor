Rails.application.routes.draw do
  namespace :doctors_backoffice do
    get 'doctors/index'
  end
  namespace :patients_backoffice do
    get 'dashboard/index'
  end
  namespace :doctors_backoffice do
    get 'dashboard/index'
  end
  devise_for :patients
  devise_for :doctors
  get 'welcome/index'
  get 'patients/index'
  get 'doctors/index'

  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
