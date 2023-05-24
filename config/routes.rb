Rails.application.routes.draw do
  devise_for :users

  root controller: :users, action: :index
  
  post "create_category" => "categories#create"
  post "book_consultation" => "consultations#book_consultation"
  patch "update_consultation" => "consultations#update_consultation"
end
