Rails.application.routes.draw do
  resources :homes
  root to: 'books#homes'
  get 'books/new'
  get 'books' => 'books#index', as: 'index_book'
  get 'books/:id' => 'books#show', as: 'show_book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
