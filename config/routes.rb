
Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  # since this are all resource routes: resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # we can use:
  resources :articles
  get "signup", to: "users#new"
  # post "users", to: "users#create"
  # to get all routes, we can call resources :users, without  post: "users" as we know users will have all RESTful routes
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :categories, except: [:destroy]
end
