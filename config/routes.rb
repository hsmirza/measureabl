Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :portfolios, only: %i[index show], shallow: true do
    get :insight, on: :member
    resources :sites, only: %i[index show]
  end

  resources :sites, only: %i[show], shallow: true do
    get :insight, on: :member
    resources :spaces, only: %i[index show]
  end
end
