Rails.application.routes.draw do
  resources :students, :instructors
  # resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
