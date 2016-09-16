Rails.application.routes.draw do
  resources :tasks, except: [:destroy] do
    get '/release' => 'tasks#release'
    patch '/destroy' => 'tasks#destroy'
    collection do
      post :confirm
    end
  end
  get '/outline' => 'tasks#outline'
  get '/delete' => 'tasks#delete'
  root 'tasks#index'

  post '/new' => 'tasks#new'
end
