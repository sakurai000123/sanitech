Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # メニュー
  resources :menus
  # 見積
  resources :estimates, only: [:index, :new, :edit, :create], shallow: true do
    # 見積明細
    resources :estimate_details, only: [:create]
    post 'estimate_details/up', to: 'estimate_details#up'
    post 'estimate_details/down', to: 'estimate_details#down'
    post 'estimate_details/front_line', to: 'estimate_details#front_line'
    post 'estimate_details/back_line', to: 'estimate_details#back_line'
    post 'estimate_details/delete_row', to: 'estimate_details#delete_row'
    post 'estimate_details/copy_row', to: 'estimate_details#copy_row'
  end
  post 'estimates/detail/:id', to: 'estimates#detail'
  post 'estimates/copy/:id', to: 'estimates#copy'
  post 'estimates/reissue/:id', to: 'estimates#reissue'
  post 'estimates/revise/:id', to: 'estimates#revise'
  post 'estimates/order', to: 'estimates#order'
  post 'estimates/invalid', to: 'estimates#invalid'
  post 'estimates/category', to: 'estimates#category'
  get 'estimates/output/:id', to: 'estimates#output'
  post 'estimates/search', to: 'estimates#search'
  post 'estimates/read', to: 'estimates#read'
  post 'estimates/sort', to: 'estimates#sort'
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
  resources :invoices, only: [:index, :show]
  post 'invoices/search', to: 'invoices#search'
  post 'invoices/issue', to: 'invoices#issue'
  post 'invoices/processing', to: 'invoices#processing'

  # 照会種別一覧
  resources :inquiry_managements
  # 担当別推移
  resources :inquiry_charges, only: [:index]
  post 'inquiry_charges/search', to: 'inquiry_charges#search'
  post 'inquiry_charges/clear', to: 'inquiry_charges#clear'
  post 'inquiry_charges/preview', to: 'inquiry_charges#preview'
  # サンアイテック推移
  resources :inquiry_inhouses, only: [:index]
  post 'inquiry_inhouses/search', to: 'inquiry_inhouses#search'
  post 'inquiry_inhouses/clear', to: 'inquiry_inhouses#clear'
  post 'inquiry_inhouses/preview', to: 'inquiry_inhouses#preview'

  # 未発注一覧
  resources :not_orders, only: [:index, :edit, :create]
  post 'not_orders/cancel', to: 'not_orders#cancel'
  get 'not_orders/output/:id', to: 'not_orders#output'
  post 'not_orders/search', to: 'not_orders#search'

  # 出荷入力
  resources :shipments
  # 入荷入力
  resources :instocks

end
