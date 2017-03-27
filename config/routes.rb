Rails.application.routes.draw do


  resources :categories do
    resources :galleries do
      resources :photos
    end
  end

  get 'welcome/index'
  patch 'categories/:id/move_up', to: 'categories#move_up', as: 'category_move_up'
  patch 'categories/:id/move_down', to: 'categories#move_down', as: 'category_move_down'

  patch 'galleries/:id/move_up', to: 'galleries#move_up', as: 'gallery_move_up'
  patch 'galleries/:id/move_down', to: 'galleries#move_down', as: 'gallery_move_down'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
