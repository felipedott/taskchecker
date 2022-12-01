Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :teams do
    resources :tasks, only: [:new, :create]
    resources :team_members, only: [:new, :create]

    # collection do
    #   get :my_tasks
    # end

  end
  resources :tasks

  # post "join", to: "team_members#join"
end
