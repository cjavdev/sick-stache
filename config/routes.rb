SickStache::Application.routes.draw do
  get "static_pages/index"

  root to: "static_pages#index"
  get "shows/titles", to: "shows#titles"
  resources :shows do
    resources :episodes
  end
  resources :episodes
end
