Rails.application.routes.draw do

  # #1
  resources :advertisements, :questions
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  # #4
  resources :posts, only: [] do
    # #5
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # post 'users/confirm' => 'users#confirm'

  # #2

  get 'about' => 'welcome#about'

  root 'welcome#index'

  
end
