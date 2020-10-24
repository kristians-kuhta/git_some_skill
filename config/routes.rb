Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :repositories
    end

    match '*unmatched', to: 'application#resource_not_found', via: :all
  end
end
