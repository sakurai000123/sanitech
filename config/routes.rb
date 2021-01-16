Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # メニュー
  resources :menus
  # 見積
  resources :estimates
  # 受注
  resources :orders
  # 売掛
  resources :receivables
  # 買掛
  resources :payables
  # マスタマネジメント
  resources :master_managements
  # 従業員入力
  resources :employee_informations
  post 'employee_informations/upsert', to: 'employee_informations#upsert'
  patch 'employee_informations/upsert/:id', to: 'employee_informations#upsert'
  # 得意先入力
  resources :customer_masters
  post 'customer_masters/upsert', to: 'customer_masters#upsert'
  patch 'customer_masters/upsert/:id', to: 'customer_masters#upsert'
  # 仕入先入力
  resources :supplier_masters
  post 'supplier_masters/upsert', to: 'supplier_masters#upsert'
  patch 'supplier_masters/upsert/:id', to: 'supplier_masters#upsert'
  # 受取手形台帳
  resources :bills_receivables
  # 現金出納帳入力
  resources :cashbooks
  # 請求書発行
  resources :invoices


  # 照会種別一覧
  resources :inquiry_managements
  # 担当別推移
  resources :inquiry_charges
  # サンアイテック推移
  resources :inquiry_inhouses
  # 経費推移
  resources :inquiry_expenses

  # 未発注一覧
  resources :not_orders
  # 出荷入力
  resources :shipments
  # 入荷入力
  resources :instocks

  # PDFテスト
  get '/test_pdf', to: 'estimates#test_pdf' 
  # チャートテスト
  get '/test_chart', to: 'estimates#test_chart'

end
