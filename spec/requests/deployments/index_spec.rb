require 'spec_helper'

describe 'deployments#index' do

  before(:each) do
    @huddle = create(:project, :name => 'Huddle')
    @deployment_1 = create(:deployment,
      :description => 'Deploying new versions of the Desmos gem.',
      :deployed_at => DateTime.parse('2011-01-01T00:00:00-08:00')
    )
    @deployment_2 = create(:deployment,
      :description => 'Deploying fix to bug introduced by gem update yesterday.',
      :deployed_at => DateTime.parse('2011-01-02T00:00:00-08:00')
    )
    @deployment_3 = create(:deployment,
      :description => 'Deploying new versions of the Desmos gem.',
      :deployed_at => DateTime.parse('2011-01-02T01:00:00-08:00')
    )

    @huddle.deployments << @deployment_1 << @deployment_2 << @deployment_3
    @huddle.save

    @deployment_1 = @deployment_1.decorator
    @deployment_2 = @deployment_2.decorator
    @deployment_3 = @deployment_3.decorator

    visit deployments_path
  end

  it 'displays a list of deployments grouped by day in reverse chronological order' do
    page.should have_content('1/1')
    within_table('deployments-2011-01-01') do
      page.should have_xpath("./tr[@id='deployment-#{@deployment_1.id}']")
    end
    page.should have_content('1/2')
    within_table('deployments-2011-01-02') do
      page.should have_xpath("./tr[1][@id='deployment-#{@deployment_2.id}']")
      page.should have_xpath("./tr[2][@id='deployment-#{@deployment_3.id}']")
    end
  end

  context 'for a given deployment' do

    it "displays the deployment's timestamp" do
      within(:xpath, "//tr[@id='#{@deployment_1.to_view_id}']/td[1]") do
        page.should have_xpath("./a[@href='/deployments/#{@deployment_1.id}' and contains(text(), '12:00AM')]")
      end
    end

    it "displays the deployed project's name" do
      within(:xpath, "//tr[@id='#{@deployment_1.to_view_id}']/td[2]") do
        page.should have_xpath("./a[@href='/projects/#{@huddle.id}' and contains(text(), 'Huddle')]")
      end
    end

    it "displays the deployer's name" do
      within(:xpath, "//tr[@id='#{@deployment_1.to_view_id}']/td[3]") do
        page.should have_content('ryan')
      end
    end

    it "displays an abbreviated version of the deployment's description" do
      within(:xpath, "//tr[@id='#{@deployment_1.to_view_id}']/td[4]") do
        page.should have_content('Deploying new versions of...')
        page.should have_xpath("./a[@href='/deployments/#{@deployment_1.id}' and contains(text(), '...')]")
      end
    end

  end

end
