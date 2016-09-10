Rails.application.routes.draw do
  
  get 'welcome', to: 'welcome#index'

  resources :users, :articles, :categories, :sub_categories, :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
