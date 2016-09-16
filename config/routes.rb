Rails.application.routes.draw do
  

  mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', password: 'users/passwords'  }

  root to: 'welcome#index'

  namespace :users do
    resources :users
  end
  # root for user's crud
  #post '/users/sign_up', :to 'users/registration#create'  

  
  resources  :articles, :categories, :sub_categories, :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
