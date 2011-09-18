100.times do |i|

  Deployment.create!(
    :deployer     => ['ryan', 'monica', 'bennington', 'kris'][rand(3)],
    :project_name => ['Huddle', 'Socrates', 'Polaris', 'CAS', 'Revrails', 'Concourse'][rand(6)],
    :deployed_at  => DateTime.parse("2011-10-#{rand(6) + 1}T#{rand(23)}:#{rand(59)}Z")
  )

end