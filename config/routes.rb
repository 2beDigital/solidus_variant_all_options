Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :products do
      resources :variants do
        collection do
          post :create_all 
          post :remove_all
        end
      end
    end
  end
end