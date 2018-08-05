Rails.application.routes.draw do
  root 'stugen#overview'
  resources :stugen
  resources :faculties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
