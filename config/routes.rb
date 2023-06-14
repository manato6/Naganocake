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
  end


  scope module: :public do
    resources :items
    get "customers/mypage"=>'customers#show'
    get 'customers/information/edit'=>'customers#edit'
    patch 'customers/information'=>'customers#update'
    get 'customers/confirm'=>'customers#confirm'
    patch 'customers/unsubscribe'=>'customers#unsubscribe'
     get 'cart_items/index'
     get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'homes/top' => 'homes#top'
  get "homes/about"=>'homes#about'
  end
end
