Rails.application.routes.draw do
  resources :grades, except: [:update, :edit]
  resources :students, except: [:update, :edit]
end
