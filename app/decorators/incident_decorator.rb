class IncidentDecorator < ApplicationDecorator
  decorates :incident

  def occurred_at_timestamp
    occurred_at.strftime('%l:%M%p').strip
  end

  def time_to_detect_in_words
    "#{time_to_detect}m"
  end

  def time_to_diagnose_in_words
    "#{time_to_diagnose}m"
  end

  def time_to_resolve_in_words
    "#{time_to_resolve}m"
  end

end