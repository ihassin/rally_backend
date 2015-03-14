Rails.application.routes.draw do
	
  resources :tags
  resources :users do
    collection do
      get 'user_for_vendor_id'
      get 'index_no_id'
    end
  end
end