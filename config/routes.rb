SickStache::Application.routes.draw do
  root to: "shows#index"
  resources :shows do
    resources :episodes, shallow: true
  end
end
