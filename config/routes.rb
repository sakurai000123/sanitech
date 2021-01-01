Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # メニュー
  resources :menus
  # マスタマネジメント
  resources :master_managements
  # 従業員入力
  resources :employee_informations do
    post 'employee_informations/upsert', to: 'employee_informations#upsert'
    patch 'employee_informations/upsert/:id', to: 'employee_informations#upsert'
  end
  # 得意先入力
  resources :customer_masters
  post 'customer_masters/upsert', to: 'customer_masters#upsert'
  patch 'customer_masters/upsert/:id', to: 'customer_masters#upsert'
  # 仕入先入力
  resources :supplier_masters
  post 'supplier_masters/upsert', to: 'supplier_masters#upsert'
  patch 'supplier_masters/upsert/:id', to: 'supplier_masters#upsert'
  
end
