DeployReporter::Application.routes.draw do
  
  resources :projects, :only => [:index, :show] do
    resources :deployments, :only => :index
    resources :incidents, :only => :index
  end
  
  resources :deployments, :only => [:index, :show, :create] do
    resources :incidents, :only => :new
  end

  resources :incidents, :only => :index
  
end