Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  get 'advertisements/new'

  get 'advertisements/create'

  # #1
  resources :posts, :advertisements

  # #2

  get 'about' => 'welcome#about'

  root 'welcome#index'

  
end
