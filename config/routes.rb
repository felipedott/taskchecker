Rails.application.routes.draw do
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :teams do
    resources :tasks, only: %i[new create]
    resources :team_members, only: %i[new create]
  end

  resources :tasks do
    resources :subtasks
  end

  resources :users, only: %i[edit update]

  resources :events do
    patch :sync_event_with_google, on: :member
  end

  get 'calendar' => 'events#event_calendar'

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
end
