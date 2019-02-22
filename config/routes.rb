Rails.application.routes.draw do
  resources :vmware_device_labs do
    get 'restore'
  end
  resources :device_labs do
    get 'restore'
  end
  resources :lab_racks do
    resources :vmware_devices
    resources :device_types
    resources :devices
    resources :labs do
      get 'restore'
    end
  end
  get '/revert' => 'home#revert'
  root :to => 'lab_racks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
