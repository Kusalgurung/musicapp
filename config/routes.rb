Rails.application.routes.draw do
  
  devise_for :users
  resources :tracks
  resources :albums
  resources :artists
  resources :home

  root 'home#home'
  get 'contact', to:'home#contact'
  post 'request_contact', to: 'home#request_contact'
  

end
