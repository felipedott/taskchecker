Rails.application.routes.draw do
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'


  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :teams do
    resources :tasks, only: [:new, :create]
    resources :team_members, only: [:new, :create]

  end
  resources :tasks
  resources :users, only: [:edit, :update]

  resources :events do
    patch :sync_event_with_google, on: :member
  end

  get 'calendar' => 'events#event_calendar'
end
