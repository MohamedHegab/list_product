Rails.application.routes.draw do
  scope module: 'frontend' do
    resources :categories, only: [:index, :show]
    resources :products, only: [:show]
    root to: 'categories#index'
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :categories do
        resources :products, shallow: true
      end
    end
  end
end
