require 'spec_helper'

describe 'root' do

  before(:each) do
    @huddle  = Project.create(:name => 'Huddle')
    @polaris = Project.create(:name => 'Polaris')
    visit root_path
  end

  it 'displays a list of deployed projects, with links to the show page for that project' do
    page.should have_content('Projects')
    within_table('projects') do
      page.should have_xpath("./tr[1]/td[1]/a[@href='/projects/#{@huddle.id}' and contains(text(), 'Huddle')]")
      page.should have_xpath("./tr[2]/td[1]/a[@href='/projects/#{@polaris.id}' and contains(text(), 'Polaris')]")
    end
  end

end
