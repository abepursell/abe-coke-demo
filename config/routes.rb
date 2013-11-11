CokeDemo::Application.routes.draw do
  resources :purchases
  root 'purchases#new'
end
