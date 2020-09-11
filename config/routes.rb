Rails.application.routes.draw do
  resources :pasarelas
  resources :empresas do
    resources :usuarios
    resources :empresa_pasarelas
  end
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "pages#index"
end
