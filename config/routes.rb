Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end
end
