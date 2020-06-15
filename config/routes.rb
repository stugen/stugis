Rails.application.routes.draw do
  root 'stugen#overview'
  scope :verify do
    get '/:id/edit/:key', to: 'stugen#edit_verify'
    get '/:id/:key', to: 'stugen#verify', as: :verify
    patch '/:id/:key', to: 'stugen#verify'
    put '/:id/:key', to: 'stugen#verify'
  end
  scope :admin do
    root 'stugen#index'
    get 'stugen/mails.json', to: 'stugen#mails'
    resources :stugen
    resources :faculties
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
