Rails.application.routes.draw do

  resources :cocktails, only: [:new, :create, :show, :index] do
    resources :doses, :reviews, only: [:new, :create, :index]
  end

  resources :doses, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
