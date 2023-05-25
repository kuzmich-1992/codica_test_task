Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:update]

  root controller: :users, action: :index
  
  post "post_avatar" => "users#post_avatar"
  post "create_category" => "categories#create"
  post "assign_user_to_category" => "categories#assign_user_to_category"
  post "book_consultation" => "consultations#book_consultation"
  patch "update_consultation" => "consultations#update_consultation"
end
