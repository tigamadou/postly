Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: redirect('/posts')
  resources :posts do
    collection do
      post :confirm
    end
  end
end
