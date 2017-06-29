Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#show'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/:id/revenue', to: 'revenue#show'
        get '/revenue', to: 'revenue#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/items', to: 'items#index'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/:id/invoices', to: 'invoices#index', as: 'invoices'
        get '/:id/transactions', to: 'transactions#index', as: 'transactions'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get '/:id/invoice', to: 'invoices#index', as: 'invoices'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :transactions, only: [:index, :show]

      namespace :items do
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/:id/best_day', to: 'best_day#show'
        get '/:id/invoice_items', to: 'invoice_items#index', as: "invoice_items"
        get '/:id/merchant', to: 'merchants#show', as: 'merchant'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get '/:id/items', to: 'items#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/customer', to: 'customers#index'
        get '/:id/merchant', to: 'merchants#index'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/:id/item', to: 'items#index'
        get '/:id/invoice', to: 'invoices#index'
        get '/random', to: 'random#show'
        get '/find', to: 'finder#show'
        get '/find_all', to: 'finder#index'
      end
      resources :invoice_items, only: [:index, :show]

    end
  end
end
