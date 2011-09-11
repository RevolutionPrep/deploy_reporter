require 'spec_helper'

describe 'projects#index' do

  before(:each) do
    @huddle   = ProjectDecorator.new(Project.create!(:name => 'Huddle', :deploy_count => 400))
    @socrates = ProjectDecorator.new(Project.create!(:name => 'Socrates'))
    visit projects_path
  end

  it 'displays a list of projects' do
    within_table('projects') do
      page.should have_xpath("./tr[@id='project-#{@huddle.id}']")
      page.should have_xpath("./tr[@id='project-#{@socrates.id}']")
    end
  end

  context 'for a given project within the list' do

    it "displays the project's name" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[1]") do
        page.should have_content('Huddle')
      end
    end

    it "displays the project's deploy count" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[2]") do
        page.should have_content('400 deployments')
      end
    end

    it "displays the project's deploy rate" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[3]") do
        page.should have_content('10.53')
      end
    end

    it "displays the project's incident rate" do
      within(:xpath, "//tr[@id='#{@huddle.to_view_id}']/td[4]") do
        page.should have_content('1/49')
      end
    end

  end

end