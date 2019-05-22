Rails.application.routes.draw do
  #get 'room/new'

  #get 'room/index'

  #get 'room/show'

  #get 'room/create'

  #get 'room/edit'

  #get 'room/update'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "welcome#index"
  resources :welcome, :only => [:index]
  resources :users, :only => [:index, :show, :edit, :update]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:index, :show, :create,  :edit, :update]
  
end
