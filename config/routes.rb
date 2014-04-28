FriendCircle::Application.routes.draw do

  resource :session
  resources :buddy_circles
  resources :users

  resources :posts
  resources :links
end
