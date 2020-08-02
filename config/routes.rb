# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :vendors
  end

end
