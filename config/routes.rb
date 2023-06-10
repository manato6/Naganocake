Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  

  scope module: :public do
    get 'items/index'
    get 'items/show'
    get "customers/mypage"=>'customers#show'
    get 'customers/edit'
     get 'cart_items/index'
     get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'homes/top' => 'homes#top'
  get "homes/about"=>'homes#about'
  end
  
end
