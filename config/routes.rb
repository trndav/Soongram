
Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  # since this are all resource routes: resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # we can use:
  resources :articles
end
