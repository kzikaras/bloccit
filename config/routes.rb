Rails.application.routes.draw do
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
  resources :posts, :advertisements, :questions

  # #2

  get 'about' => 'welcome#about'

  root 'welcome#index'

  
end
