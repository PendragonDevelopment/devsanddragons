# == Route Map
#
#                   Prefix Verb   URI Pattern                        Controller#Action
#                 profiles GET    /profiles(.:format)                profiles#index
#                          POST   /profiles(.:format)                profiles#create
#              new_profile GET    /profiles/new(.:format)            profiles#new
#             edit_profile GET    /profiles/:id/edit(.:format)       profiles#edit
#                  profile GET    /profiles/:id(.:format)            profiles#show
#                          PATCH  /profiles/:id(.:format)            profiles#update
#                          PUT    /profiles/:id(.:format)            profiles#update
#                          DELETE /profiles/:id(.:format)            profiles#destroy
#         campaigns_course GET    /courses/:id/campaigns(.:format)   campaigns#index
#                  courses GET    /courses(.:format)                 courses#index
#                          POST   /courses(.:format)                 courses#create
#               new_course GET    /courses/new(.:format)             courses#new
#              edit_course GET    /courses/:id/edit(.:format)        courses#edit
#                   course GET    /courses/:id(.:format)             courses#show
#                          PATCH  /courses/:id(.:format)             courses#update
#                          PUT    /courses/:id(.:format)             courses#update
#                          DELETE /courses/:id(.:format)             courses#destroy
#        missions_campaign GET    /campaigns/:id/missions(.:format)  missions#index
#                campaigns GET    /campaigns(.:format)               campaigns#index
#                          POST   /campaigns(.:format)               campaigns#create
#             new_campaign GET    /campaigns/new(.:format)           campaigns#new
#            edit_campaign GET    /campaigns/:id/edit(.:format)      campaigns#edit
#                 campaign GET    /campaigns/:id(.:format)           campaigns#show
#                          PATCH  /campaigns/:id(.:format)           campaigns#update
#                          PUT    /campaigns/:id(.:format)           campaigns#update
#                          DELETE /campaigns/:id(.:format)           campaigns#destroy
#           quests_mission GET    /missions/:id/quests(.:format)     quests#index
#                 missions GET    /missions(.:format)                missions#index
#                          POST   /missions(.:format)                missions#create
#              new_mission GET    /missions/new(.:format)            missions#new
#             edit_mission GET    /missions/:id/edit(.:format)       missions#edit
#                  mission GET    /missions/:id(.:format)            missions#show
#                          PATCH  /missions/:id(.:format)            missions#update
#                          PUT    /missions/:id(.:format)            missions#update
#                          DELETE /missions/:id(.:format)            missions#destroy
#                   quests GET    /quests(.:format)                  quests#index
#                          POST   /quests(.:format)                  quests#create
#                new_quest GET    /quests/new(.:format)              quests#new
#               edit_quest GET    /quests/:id/edit(.:format)         quests#edit
#                    quest GET    /quests/:id(.:format)              quests#show
#                          PATCH  /quests/:id(.:format)              quests#update
#                          PUT    /quests/:id(.:format)              quests#update
#                          DELETE /quests/:id(.:format)              quests#destroy
#                     root GET    /                                  visitors#index
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            devise_invitable/registrations#cancel
#        user_registration POST   /users(.:format)                   devise_invitable/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           devise_invitable/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise_invitable/registrations#edit
#                          PATCH  /users(.:format)                   devise_invitable/registrations#update
#                          PUT    /users(.:format)                   devise_invitable/registrations#update
#                          DELETE /users(.:format)                   devise_invitable/registrations#destroy
#   accept_user_invitation GET    /users/invitation/accept(.:format) devise/invitations#edit
#   remove_user_invitation GET    /users/invitation/remove(.:format) devise/invitations#destroy
#          user_invitation POST   /users/invitation(.:format)        devise/invitations#create
#      new_user_invitation GET    /users/invitation/new(.:format)    devise/invitations#new
#                          PATCH  /users/invitation(.:format)        devise/invitations#update
#                          PUT    /users/invitation(.:format)        devise/invitations#update
#                    users GET    /users(.:format)                   users#index
#                          POST   /users(.:format)                   users#create
#                 new_user GET    /users/new(.:format)               users#new
#                edit_user GET    /users/:id/edit(.:format)          users#edit
#                     user GET    /users/:id(.:format)               users#show
#                          PATCH  /users/:id(.:format)               users#update
#                          PUT    /users/:id(.:format)               users#update
#                          DELETE /users/:id(.:format)               users#destroy
#                     page GET    /pages/*id                         high_voltage/pages#show
#

Rails.application.routes.draw do

  resources :profiles
  resources :courses do
    member do
      get 'campaigns', to: 'campaigns#index'
    end
  end
  resources :campaigns do
    member do
      get 'missions', to: 'missions#index'
    end
  end
  resources :missions do
    member do
      get 'quests', to: 'quests#index'
    end
  end
  resources :quests

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
