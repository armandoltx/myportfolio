Rails.application.routes.draw do


  #        get 'pages/home'
  #        get 'pages/about'
  #        get 'pages/contact'

  # The routes above are for statics pages, and we do not want to access to those pages => http://localhost:3000/pages/home instead we want to access http://localhost:3000/about and also we want home to be the root one, so when you type: http://localhost:3000 you go to pages/home. WE change the routes to:

  root to: 'pages#home'  # we now point http://localhost:3000/pages/home to ==> http://localhost:3000

  get 'about', to: 'pages#about' # we now point http://localhost:3000/pages/home to ==> http://localhost:3000/about
  get 'contact', to: 'pages#contact' # we now point http://localhost:3000/pages/home to ==> http://localhost:3000/about


  resources :blogs
  resources :portfolios
end
