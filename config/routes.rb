DeployReporter::Application.routes.draw do
  root :to => 'projects#index'
  resources :projects, :only => :index do
    resources :deployments, :only => :index
  end
end