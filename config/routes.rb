Rails.application.routes.draw do
  devise_for :users

  root controller: :users, action: :index
  
  post "create_category" => "categories#create"
  post "assign_user_to_category" => "categories#assign_user_to_category"
  post "book_consultation" => "consultations#book_consultation"
  patch "update_consultation" => "consultations#update_consultation"
end
