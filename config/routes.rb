Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :items
  resources :customers
  patch 'admin/customers/:id'=>'customers#update'
  resources :orders
  end

scope module: :admin do
  get 'admin'=>'homes#top',as: 'admin_top'
end

  scope module: :public do
    resources :items
    get "customers/mypage"=>'customers#show'
    get 'customers/information/edit'=>'customers#edit'
    patch 'customers/information'=>'customers#update'
    get 'customers/confirm'=>'customers#confirm'
    patch 'customers/unsubscribe'=>'customers#unsubscribe'
    delete 'cart_items/all_destroy'=>'cart_items#all_destroy'
    resources :cart_items,only: [:index, :create, :update, :destroy]
     get 'orders/complete'=>'orders#complete'
    resources :orders
    post 'orders/confirm'=>'orders#confirm'
    get 'homes/top' => 'homes#top'
  get "homes/about"=>'homes#about'
  end
end
