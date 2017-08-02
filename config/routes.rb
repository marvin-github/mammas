Rails.application.routes.draw do


  get 'merchant/show'

  get 'merchant/edit'

  resources :merchant

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  root to: 'gif#cool'

  get 'menu/index'
  get '/invoice/download', to: 'invoice#download'
  resources :invoice
  get '/invoice/display_pdf/:id', to: 'invoice#display_pdf', as: 'print'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
