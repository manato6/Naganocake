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
  end


  scope module: :public do
    resources :items
    get "customers/mypage"=>'customers#show'
    get 'customers/information/edit'=>'customers#edit'
    patch 'customers/information'=>'customers#update'
    get 'customers/confirm'=>'customers#confirm'
    patch 'customers/unsubscribe'=>'customers#unsubscribe'
    resources :cart_items
    post 'cart_items'=>'cart_items#create'
    resources :orders
    get 'homes/top' => 'homes#top'
  get "homes/about"=>'homes#about'
  end
end
