Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :menus
  resources :master_managements
  resources :employee_informations
  post 'employee_informations/upsert', to: 'employee_informations#upsert'
  patch 'employee_informations/upsert/:id', to: 'employee_informations#upsert'
end
