Rails.application.routes.draw do
  devise_for :users
  
#customising rooting for devise
  as :user do 

    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'

  end
  #Rooting home page away from ruby default startup, to home
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
