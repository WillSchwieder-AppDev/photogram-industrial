Rails.application.routes.draw do
  root "photos#index"

  

  

  devise_for :users

  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  get ":username/liked" => "photos#liked", as: :liked_photos
  get ":username/feed" => "photos#feed", as: :user_feed
  get ":username/followers" => "photos#followers", as: :user_followers
  get ":username/following" => "photos#following", as: :user_following
  
  get ":username" => "users#show", as: :user
end
