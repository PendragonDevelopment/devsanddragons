Rails.application.routes.draw do

  resources :profiles
  resources :courses
  resources :campaigns
  resources :missions
  resources :quests

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
