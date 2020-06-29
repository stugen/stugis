Rails.application.routes.draw do
  get ':locale' => 'stugen#overview', as: 'root'
  root 'stugen#overview'
  scope '(:locale)', locale: /de|en/ do
    scope :verify do
      get '/:id/edit/:key', to: 'stugen#edit_verify', as: :edit_verify
      get '/:id/:key', to: 'stugen#verify', as: :verify
      patch '/:id/:key', to: 'stugen#verify'
      put '/:id/:key', to: 'stugen#verify'
    end
    scope :admin do
      root 'stugen#index', as: 'admin'
      get 'stugen/mails.json', to: 'stugen#mails'
      resources :stugen
      resources :faculties
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
