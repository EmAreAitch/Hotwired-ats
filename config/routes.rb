Rails.application.routes.draw do
  get 'charts/show'
  get 'resumes/show'
  resources :applicants
  resources :jobs
  resources :notifications, only: %i[index]
  devise_for :users,
  path: '',
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'

  },
  path_names: {
    sign_in: 'login',
    password: 'forgot',
    confirmation: 'confirm',
    sign_up: 'sign_up',
    sign_out: 'signout'
  } 
  get 'dashboard/show'

  authenticated :user do
    root to: 'dashboard#show', as: :user_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  concern :commentable do
    resources :comments, only: %i[index create]
  end

  resources :applicants,concerns: :commentable do
    patch :change_stage, on: :member
    get :resume, action: :show, controller: 'resumes'
    resources :emails, only: %i[index new create show]
    resources :email_replies, only: %i[new]
  end

  namespace :careers do
    resources :accounts, only: %i[show] do
      resources :jobs, only: %i[index show], shallow: true do
        resources :applicants, only: %i[new create]
      end
    end
  end
  resources :users
  resources :invites, only: %i[create update]
  get 'invite', to: 'invites#new', as: 'accept_invite'
  get 'charts/show', as: :chart
# Snip
end