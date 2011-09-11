require 'spec_helper'

describe 'projects#show' do

  before(:each) do
    @project = Project.create!(:name => 'Huddle')
  end

  it 'displays the name of the project' do
    visit project_path(@project)
    page.should have_content('Huddle')
  end

  it 'displays the total deploy count' do
    
  end

  it 'displays the deploy rate'

  it 'displays the incident rate'

  it 'displays a graph of the deployments over time'

  it "links to the project's deployments index"

  it "links to the project's incidents index"

end