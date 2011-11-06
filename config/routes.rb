DeployReporter::Application.routes.draw do

  root :to => 'application#home'

  resources :projects, :only => [:index, :show] do
    resources :deployments, :only => :index
    resources :incidents, :only => :index
  end

  resources :deployments, :only => [:index, :show, :create] do
    resources :incidents, :only => :new
  end

  resources :incidents, :only => :index

end
