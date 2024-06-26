Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

    resources :users do
      resources :posts do
          resources :comments
      end
    end

    resources :users do
      resources :groups do
          resources :messages
      end
    end

    resources :users do
      resources :stories
      resources :reels
      resources :notes
      resources :groups
    end

    resources :likes, only: %i[create destroy]
    get 'users/:id', to: 'users#show', as: 'user_profile'
    post 'users/:id/follow', to: "users#follow", as: 'follow'
    post 'users/:id/unfollow', to: "users#unfollow", as: 'unfollow'
    post 'users/:id/accept', to: "users#accept", as: 'accept'
    post 'users/:id/decline', to: "users#decline", as: 'decline'
    post 'users/:id/cancel', to: "users#cancel", as: 'cancel'
    get 'users/:id/user_list', to: "users#user_list", as: 'user_list'
    get 'users/:id/request_page', to: 'users#request_page', as: 'request'
    get 'users/:id/following', to: 'users#following', as: 'following'
    get 'users/:id/followers', to: 'users#followers', as: 'followers'
    get 'users/:id/user_post', to: "users#user_post", as: 'user_postss'
    get '/search', to: "posts#search"    
end
