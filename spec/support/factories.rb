FactoryGirl.define do

  factory :deployment do
    deployer 'ryan'
    deployed_at { DateTime.now }
  end

  factory :incident

  factory :project do
    name 'Huddle'
  end

end

RSpec.configure do |config|
  config.include(FactoryGirl::Syntax::Methods)
end
