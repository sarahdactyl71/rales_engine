Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
      end
      resources :customers, only: [:index, :show]
      namespace :customers do
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
        get '/:id/transactions', to: 'transactions#index', as: 'transactions'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
      end
      resources :transactions, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      namespace :invoices do
        get '/:id/items', to: 'items#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/customer', to: 'customers#index'
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
