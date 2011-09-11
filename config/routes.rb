DeployReporter::Application.routes.draw do
  
  resources :projects, :only => :show
  
end