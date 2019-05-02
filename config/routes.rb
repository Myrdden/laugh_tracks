Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/comedians', to: 'comedians#index'
  get '/comedians/new', to: 'comedians#new_comedian'
  post '/comedians/new', to: 'comedians#create'
  get '/comedians/addSpecial', to: 'comedians#add_special'
  post '/comedians/addSpecial', to: 'comedians#new_special'
  delete '/comedians/delete', to: 'comedians#delete'
end
