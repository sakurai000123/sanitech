Rails.application.routes.draw do
  root to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # メニュー
  resources :menus
  # 見積
  resources :estimates, only: [:index, :new, :edit, :create], shallow: true do
    # 見積明細
    resources :estimate_details, only: [:index]
    post 'detail_create', to: 'estimates#detail_create'
    post 'up', to: 'estimates#up'
    post 'down', to: 'estimates#down'
    post 'front_line', to: 'estimates#front_line'
    post 'back_line', to: 'estimates#back_line'
    post 'delete_row', to: 'estimates#delete_row'
    post 'copy_row', to: 'estimates#copy_row'
  end
  # post 'estimates/upsert', to: 'estimates#upsert'
  # post 'estimates/upsert/:id', to: 'estimates#upsert'
  # patch 'estimates/upsert/:id', to: 'estimates#upsert'
  get 'estimates/output/:id', to: 'estimates#output'
  post 'estimates/search', to: 'estimates#search'
  post 'estimates/detail/:id', to: 'estimates#detail'
  post 'estimates/copy/:id', to: 'estimates#copy'
  post 'estimates/reissue/:id', to: 'estimates#reissue'
  post 'estimates/revise/:id', to: 'estimates#revise'
  post 'estimates/order', to: 'estimates#order'
  post 'estimates/invalid', to: 'estimates#invalid'
  post 'estimates/category', to: 'estimates#category'
  post 'estimates/read', to: 'estimates#read'
  post 'estimates/sort', to: 'estimates#sort'
  # 受注
  resources :orders
  post 'orders/upsert', to: 'orders#upsert'
  post 'orders/upsert/:id', to: 'orders#upsert'
  post 'orders/read', to: 'orders#read' #add id?, change get?
  post 'orders/pdf', to: 'orders#pdf' #add id, change get?
  patch 'orders/upsert/:id', to: 'orders#upsert'
  # 売掛
  resources :receivables
  post 'receivables/upsert', to: 'receivables#upsert'
  get 'receivables/output/:id', to: 'receivables#output'
  # 買掛
  resources :payables
  post 'payables/upsert', to: 'payables#upsert'
  get 'payables/output/:id', to: 'payables#output'
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
  resources :shipments, only: [:index, :create]
  post 'shipments/search', to: 'shipments#search'
  post 'shipments/on', to: 'shipments#on'
  post 'shipments/off', to: 'shipments#off'
  post 'shipments/trial_send', to: 'shipments#trial_send'
  post 'shipments/no_preview', to: 'shipments#no_preview'

  # 入荷入力
  resources :instocks, only: [:index, :create]
  post 'instocks/search', to: 'instocks#search'
  post 'instocks/on', to: 'instocks#on'
  post 'instocks/off', to: 'instocks#off'


end
