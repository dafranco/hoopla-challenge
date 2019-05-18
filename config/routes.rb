Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :metrics, only: [:index] do
    resources :metric_values, only: [:index, :new, :update, :create, :edit]
  end
end
