class Project < ActiveRecord::Base
  has_many :deployments
  validates :name, :presence => true, :uniqueness => true

  def deploy_rate
    return 0.0 if 0 == (deployment_date_count = deploy_count_by_date.size)
    deploy_count_by_date.inject(0.0) { |sum, count| sum + count } / deployment_date_count
  end

  def incident_rate
    0.0203
  end

  def deploy_count
    deployments.size
  end

  private

  def deploy_count_by_date
    @deploy_count_by_date ||= deployments.group_by(&:deployed_on).values.map(&:length)
  end

end
