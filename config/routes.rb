Rails.application.routes.draw do

  get 'search/index'

  resources :merchant
  resources :item

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  #root to: 'gif#cool'
  root to: 'sessions#new'
  get 'menu/index'

  get 'search/index'
  get 'search/invoice_number'
  get 'search/invoice_date'

  get '/invoice/download', to: 'invoice#download'
  resources :invoice
  get '/invoice/display_pdf/:id', to: 'invoice#display_pdf', as: 'print'
  get '/invoice/display_small_pdf/:id', to: 'invoice#display_small_pdf', as: 'print_small'
  get '/invoice/email_invoice/:id', to: 'invoice#email_invoice', as: 'email'
  delete '/invoice/delete_item/:id', to: 'invoice#delete_item', as: 'delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
