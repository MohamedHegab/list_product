Rails.application.routes.draw do
  scope module: 'frontend' do
    resources :categories
    root to: 'categories#index'
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :categories
    end
  end
end
