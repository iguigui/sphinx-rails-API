Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:signin, :signup] do
    collection do
      post '/signup', to: 'users#signup'
      post '/signin', to: 'users#signin'
    end
  end
end
