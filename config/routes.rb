DeployReporter::Application.routes.draw do
  
  resources :projects, :only => :show do
    resources :deployments, :only => :index
    resources :incidents, :only => :index
  end
  
end