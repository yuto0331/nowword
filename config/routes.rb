Rails.application.routes.draw do
    root 'voices#top'
    resources :voices do
        collection do
        post :confirm
    end
    end
end
