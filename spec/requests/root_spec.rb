require 'spec_helper'

describe 'root' do

  before(:each) do
    @huddle  = create(:project, :name => 'Huddle')
    @polaris = create(:project, :name => 'Polaris')
    visit root_path
  end

  it_should_behave_like 'a page with navigation chrome'

  it 'displays a list of deployed projects, with links to the show page for that project' do
    within_table('projects') do
      page.should have_xpath("./tr[1]/td[1]/a[@href='/projects/#{@huddle.id}' and contains(text(), 'Huddle')]")
      page.should have_xpath("./tr[2]/td[1]/a[@href='/projects/#{@polaris.id}' and contains(text(), 'Polaris')]")
    end
  end

end
