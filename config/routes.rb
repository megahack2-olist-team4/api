Rails.application.routes.draw do
  devise_for :admins, skip: [:passwords]
  as :admin do
    get 'password/new', to: redirect('/404'), as: :new_admin_password
  end

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
