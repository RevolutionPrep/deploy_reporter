require 'spec_helper'

describe 'projects#show' do

  before(:each) do
    @project = Project.new(:name => 'Huddle')
    @project.deployments << Deployment.create!(:deployer => 'ryan')
    @project.save!
    visit project_path(@project)
  end

  it 'displays the name of the project' do
    page.should have_content('Huddle')
  end

  it 'displays the total deploy count' do
    within('#deploy_count') do
      page.should have_content('1')
    end
  end

  it 'displays the deploy rate' do
    within('#deploy_rate') do
      page.should have_content('10.53')
    end
  end

  it 'displays the incident rate' do
    within('#incident_rate') do
      page.should have_content('1/49')
    end
  end

  it "links to the project's deployments index" do
    page.should have_xpath("//a[@href='/projects/#{@project.id}/deployments' and contains(text(), 'Deployments')]")
  end

  it "links to the project's incidents index" do
    page.should have_xpath("//a[@href='/projects/#{@project.id}/incidents' and contains(text(), 'Incidents')]")
  end

  it 'displays a graph of the deployments over time'

end