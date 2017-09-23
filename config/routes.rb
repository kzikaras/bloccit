Rails.application.routes.draw do
  # get 'sponsored_posts/show'

  # get 'sponsored_posts/new'

  # get 'sponsored_posts/edit'

  # get 'questions/index'

  # get 'questions/new'

  # get 'questions/create'

  # get 'questions/show'

  # get 'questions/edit'

  # get 'questions/update'

  # get 'questions/destroy'

  # get 'advertisements/index'

  # get 'advertisements/show'

  # get 'advertisements/new'

  # get 'advertisements/create'

  # #1
  resources :advertisements, :questions
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end


  # #2

  get 'about' => 'welcome#about'

  root 'welcome#index'

  
end
