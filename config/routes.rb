FriendCircle::Application.routes.draw do

  resource :session
  resources :buddy_circles
  resources :users

  resources :posts do
    collection do
      # /posts/feed
      resources :feed
    end
  end

  # resource :feed, only: [:show]
  # /feed

  resources :links
end
