Rails.application.routes.draw do


  devise_for :teachers, path: 'teachers', controllers: { registrations: "teachers/registrations" }
  devise_for :students
  devise_for :users
  root to: 'pages#home'

  resources :assignments
  resources :classrooms
  resources :evaluations
  resources :programs
  resources :students
  resources :teachers
  resources :topics

  get 'sign_up', to: 'pages#sign_up', as: 'sign_up'
end
