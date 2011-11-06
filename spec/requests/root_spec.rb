require 'spec_helper'

describe 'root' do

  before(:each) do
    Project.create(:name => 'Huddle')
    Project.create(:name => 'Polaris')
    visit root_path
  end

  it 'displays a list of deployed projects' do
    page.should have_content('Projects')
    within_table('projects') do
      page.should have_content('Huddle')
      page.should have_content('Polaris')
    end
  end

end
