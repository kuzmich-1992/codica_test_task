Rails.application.routes.draw do
  devise_for :users

  root controller: :users, action: :index
end
