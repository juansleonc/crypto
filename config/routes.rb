# frozen_string_literal: true

Rails.application.routes.draw do
  get 'download_investment_summary', to: 'main#download_investment_summary'
  resources :calculate
  devise_for :users
  root to: 'main#index'
end
