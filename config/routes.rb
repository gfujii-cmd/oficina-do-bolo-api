Rails.application.routes.draw do
  namespace 'v1' do 
    resources :cakes
    get "/cakes/flavor/:flavor", to: 'cakes#find_by_flavor'

    resources :stores
  end
end
