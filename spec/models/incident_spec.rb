require 'spec_helper'

describe Incident do

  it 'has the right attributes' do
    attributes = [
      :created_at,
      :description,
      :had_errors,
      :id,
      :lessons_learned,
      :noticed_outside_of_development,
      :occurred_at,
      :required_formal_incident_report,
      :required_redeploy,
      :required_rollback,
      :time_to_detect,
      :time_to_diagnose,
      :time_to_resolve,
      :updated_at
    ]
    Incident.column_names.sort.map(&:to_sym).should eql(attributes)
  end

end

describe Incident, 'validations' do

  it { should validate_presence_of(:occurred_at) }

end
