Rails.application.routes.draw do
  resources :tracked_sites
  resources :tracked_pages
  resources :tracked_data
  get 'welcome/index'

  root 'welcome#index'
end
