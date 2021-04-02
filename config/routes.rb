Rails.application.routes.draw do

  devise_for :customers, skip: :registrations,controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords'
  }

  devise_scope :customer do
  get 'customers/sign_up' => 'public/registrations#new', as: :new_customer_registration
  post 'customers' => 'public/registrations#create', as: :customer_registration
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    resource :customers, only:[:edit, :show, :update]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :orders, only:[:index, :create, :new, :show]
    resources :addresses, except:[:new, :show]
  end

  delete 'cart_items/' => 'public/cart_items#alldelete'
  get 'customers/destroy' => 'public/customers#confirm'
  patch 'customers/destroy' => 'public/customers#destroy'
  post 'orders/' => 'public/orders#confirm'
  get 'orders/' => 'public/orders#complete'
  root :to => 'public/homes#top'
  get 'about/' => 'public/homes#about'

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :order_items, only: [:update]
    resources :orders, only:[:index, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, except:[:destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    root :to => 'homes#top', as: 'top'

  end

end
