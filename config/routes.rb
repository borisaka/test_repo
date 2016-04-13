Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :countries, only: [:index, :show]
      resources :markets
    end
  end
end
