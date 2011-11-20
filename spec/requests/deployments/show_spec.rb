require 'spec_helper'

describe 'deployments#show' do

  before(:each) do
    @deployment = create(:deployment,
      :project_name => 'Huddle',
      :deployed_at  => DateTime.parse('2011-09-17T17:00:00-07:00'),
      :description  => 'Changing the gems required for the whiteboard platform.'
    )
    visit deployment_path(@deployment)
  end

  it_should_behave_like 'a page with navigation chrome'

  it 'displays the name of the project deployed' do
    page.should have_content('Huddle')
  end

  it 'displays the time of the deployment' do
    page.should have_content('Saturday, 09/17/11 @ 5:00PM')
  end

  it 'displays the name of the deployer' do
    page.should have_content('ryan')
  end

  it 'displays the description of the deployment' do
    page.should have_content('Changing the gems required for the whiteboard platform.')
  end

  it 'displays the links to create a new incident report for this deployment' do
    page.should have_xpath("//a[@href='/deployments/#{@deployment.id}/incidents/new' and contains(text(), 'Report an incident')]")
  end

  context 'if the deployment had incidents' do

    it 'displays a list of incidents related to this deployment'

  end

end
