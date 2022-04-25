Rails.application.routes.draw do
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root "homes#top"
    resources :items
    resources :genres
    resources :customers
    resources :orders
  end

  scope module: :public do
     root "homes#top"
     get 'homes/about' => 'homes#about', as: :about
    # get 'my_page/unsubscribe' => 'my_page#unsubscribe', as: :unsubscribe
     resources :my_page
     get 'customers/unsubscribe' => 'customers#unsubscribe', as: :unsubscribe
     patch 'customers/withdrawal' => 'customers#withdrawal', as: :withdrawal
     resource :customers
     get 'customers/edit_customer' => 'customers#edit', as: :edit_customer
     resources :addresses
     resources :items
     delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: :destroy_all
     resources :cart_items
     post 'orders/confirm' => 'orders#confirm', as: :confirm
     get 'orders/complete' => 'orders#complete', as: :complete
     resources :orders
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
