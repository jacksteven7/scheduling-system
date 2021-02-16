Rails.application.routes.draw do
  resources :grades do
    get :students, on: :member
    post :assign_students, on: :member
  end
  
  resources :students do 
    get :grades, on: :member
  end
end
