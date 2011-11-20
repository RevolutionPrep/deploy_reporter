require 'spec_helper'

describe 'projects#show' do

  before(:each) do
    @project = build(:project)
    10.times do
      @project.deployments << create(:deployment)
    end
    @project.save!
    @project = @project.decorator
    visit project_path(@project)
  end

  it_should_behave_like 'a page with navigation chrome'

  it 'displays the name of the project' do
    page.should have_content(@project.name)
  end

  it 'displays the total deploy count' do
    within('#deploy_count') do
      page.should have_content(@project.deploy_count)
    end
  end

  it 'displays the deploy rate' do
    within('#deploy_rate') do
      page.should have_content(@project.deploy_rate)
    end
  end

  it 'displays the incident rate' do
    within('#incident_rate') do
      page.should have_content(@project.incident_rate_fraction)
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
