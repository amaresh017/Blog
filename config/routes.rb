Rails.application.routes.draw do
  

  mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', password: 'users/passwords'  }

  root to: 'welcome#index'

  namespace :users do
    resources :users
  end
  # to post an comment on an articale
  resources :articles do
    resources :comments, :only => [:create]
  end  

  
  resources  :categories, :sub_categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
