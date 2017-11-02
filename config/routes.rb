Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  #        get 'pages/home'
  #        get 'pages/about'
  #        get 'pages/contact'

  # The routes above are for statics pages, and we do not want to access to those pages => http://localhost:3000/pages/home instead we want to access http://localhost:3000/about and also we want home to be the root one, so when you type: http://localhost:3000 you go to pages/home. WE change the routes to:

  root to: 'pages#home'  # we now point http://localhost:3000/pages/home to ==> http://localhost:3000

  get 'about', to: 'pages#about' # we now point http://localhost:3000/pages/home to ==> http://localhost:3000/about
  get 'contact', to: 'pages#contact' # we now point http://localhost:3000/pages/home to ==> http://localhost:3000/about
  get 'tech-news', to: 'pages#tech_news'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  resources :portfolios, except: [:show] do  # Give me all the routes for portfolios except the ones include in the array and now I can create my route for show action
    put :sort, on: :collection # this is to create the put statement for drag and drop functionality
  end
  get 'angular-itmes', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
            # The as: 'portfolio_show' is called NAMING ROUTES and what it does is giving another prefix name, check in rake routes.
            # WHEN you customise the routes, need to check the links in the whole app, because they are affected by the changes.
            # Instead of using portfolio_path(portfolio_item) we use portfolio_show_path(portfolio_item) in the link created in the index page to link to the show page
end
