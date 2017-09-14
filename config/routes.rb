Rails.application.routes.draw do

  get 'portfolios/index'

  get 'portfolios/new'

  get 'portfolios/create'

  get 'portfolios/edit'

  get 'portfolios/update'

  get 'portfolios/show'

  get 'portfolios/destroy'

  resources :blogs

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
