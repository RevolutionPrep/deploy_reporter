require 'spec_helper'

describe 'projects#index' do

  before(:each) do
    @project  = build(:project)
    @project.deployments << create(:deployment)
    @project.save!
    @huddle   = @project.decorator
    @socrates = create(:project, :name => 'Socrates').decorator
    visit projects_path
  end

  it_should_behave_like 'a page with navigation chrome'

  it 'displays a list of projects' do
    within_table('projects') do
      page.should have_xpath("./tr[@id='project-#{@huddle.id}']")
      page.should have_xpath("./tr[@id='project-#{@socrates.id}']")
    end
  end

  context 'for a given project within the list' do

    it "displays the project's name as a link to the project's show page" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[1]") do
        page.should have_xpath("./a[@href='/projects/#{@huddle.id}' and contains(text(), 'Huddle')]")
      end
    end

    it "displays the project's deploy count" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[2]") do
        page.should have_xpath("./a[@href='/projects/#{@huddle.id}/deployments' and contains(text(), '1 deployment')]")
      end
    end

    it "displays the project's deploy rate" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[3]") do
        page.should have_content(@huddle.deploy_rate)
      end
    end

    it "displays the project's incident rate" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[4]") do
        page.should have_xpath("./a[@href='/projects/#{@huddle.id}/incidents' and contains(text(), '1/49')]")
      end
    end

  end

end
