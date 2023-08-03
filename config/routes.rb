Rails.application.routes.draw do
  post 'sign_in', to: 'application#sign_in'
  delete 'sign_out', to: 'application#sign_out'
  get 'current_user', to: 'application#current_user'
  post 'authenticate_user', to: 'application#authenticate_user!'

  # user
  resources :users, only: [:index, :show] do
    member do
      post 'credit_wallet'
      post 'debit_wallet'
    end
  end

  # team
  resources :teams, only: [:index, :show] do
    member do
      post 'credit_wallet'
      post 'debit_wallet'
    end
  end

  # stock
  resources :stocks, only: [:index, :show] do
    member do
      post 'credit_wallet'
      post 'debit_wallet'
    end
  end

  # stock price
  get 'latest_stock_price/price/:symbol', to: 'latest_stock_price#price'
  get 'latest_stock_price/prices', to: 'latest_stock_price#prices'
  get 'latest_stock_price/price_all', to: 'latest_stock_price#price_all'
end
