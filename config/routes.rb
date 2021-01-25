Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # メニュー
  resources :menus
  # 見積
  resources :estimates, shallow: true do
    # 見積明細
    resources :estimate_details
  end
  post 'estimates/upsert', to: 'estimates#upsert'
  patch 'estimates/upsert/:id', to: 'estimates#upsert'
  # 受注
  resources :orders
  post 'orders/upsert', to: 'orders#upsert'
  post 'orders/upsert/:id', to: 'orders#upsert'
  patch 'orders/upsert/:id', to: 'orders#upsert'
  # 売掛
  resources :receivables
  # 買掛
  resources :payables
  # マスタマネジメント
  resources :master_managements
  # 従業員入力
  resources :employee_informations, only: [:index, :edit]
  post 'employee_informations', to: 'employee_informations#upsert'
  post 'employee_informations/:id', to: 'employee_informations#upsert'
  patch 'employee_informations/:id', to: 'employee_informations#upsert'
  # 得意先入力
  resources :customer_masters, only: [:index, :edit]
  post 'customer_masters', to: 'customer_masters#upsert'
  post 'customer_masters/:id', to: 'customer_masters#upsert'
  patch 'customer_masters/:id', to: 'customer_masters#upsert'
  # 仕入先入力
  resources :supplier_masters, only: [:index, :edit]
  post 'supplier_masters/upsert', to: 'supplier_masters#upsert'
  post 'supplier_masters/upsert/:id', to: 'supplier_masters#upsert'
  patch 'supplier_masters/upsert/:id', to: 'supplier_masters#upsert'
  # 請求書発行
  resources :invoices


  # 照会種別一覧
  resources :inquiry_managements
  # 担当別推移
  resources :inquiry_charges
  # サンアイテック推移
  resources :inquiry_inhouses

  # 未発注一覧
  resources :not_orders
  # 出荷入力
  resources :shipments
  # 入荷入力
  resources :instocks

end
