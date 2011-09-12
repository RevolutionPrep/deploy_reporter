require 'spec_helper'

describe 'incidents#index' do
  
  before(:each) do
    @incident_1 = IncidentDecorator.new(
      Incident.create!(
        :occurred_at                     => DateTime.parse('2011-01-01T10:00:00Z'),
        :time_to_detect                  => 2,
        :time_to_diagnose                => 1,
        :time_to_resolve                 => 4,
        :had_errors                      => true,
        :required_redeploy               => true,
        :required_rollback               => true,
        :noticed_outside_of_development  => true,
        :required_formal_incident_report => true
      )
    )
    @incident_2 = IncidentDecorator.new(Incident.create!(:occurred_at => DateTime.parse('2011-01-02T00:00:00Z')))
    visit incidents_path
  end

  it 'displays a list of incidents grouped by date' do
    within_table('incidents-2011-01-01') do
      page.should have_xpath("./tr[@id='incident-#{@incident_1.id}']")
    end
    within_table('incidents-2011-01-02') do
      page.should have_xpath("./tr[@id='incident-#{@incident_2.id}']")
    end
  end

  context 'for a given incident' do

    it "displays the incident's occurrance timestamp" do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[1]") do
        page.should have_content('10:00AM')
      end
    end

    it "displays the incident's time to detect" do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[2]") do
        page.should have_content('2m')
      end
    end

    it "displays the incident's time to diagnose" do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[3]") do
        page.should have_content('1m')
      end
    end

    it "displays the incident's time to recover" do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[4]") do
        page.should have_content('4m')
      end
    end

    it 'displays an indicator if the incident had errors' do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[5]") do
        page.should have_xpath("./a[@class='severity orange' and @alt='There were errors']")
      end
    end

    it 'displays an indicator if the incident required a redeployment' do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[5]") do
        page.should have_xpath("./a[@class='severity orange' and @alt='A redeployment was required']")
      end
    end

    it 'displays an indicator if the incident required a rollback' do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[5]") do
        page.should have_xpath("./a[@class='severity red' and @alt='A rollback was required']")
      end
    end

    it 'displays an indicator if the incident was noticed outside of development' do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[5]") do
        page.should have_xpath("./a[@class='severity red' and @alt='Noticed outside of the development team']")
      end
    end

    it 'displays an indicator if the incident required a formal incident report' do
      within(:xpath, "//tr[@id='#{@incident_1.to_view_id}']/td[5]") do
        page.should have_xpath("./a[@class='severity red' and @alt='A formal incident report was required']")
      end
    end

  end

end