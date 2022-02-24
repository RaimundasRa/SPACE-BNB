module ApplicationHelper

  def colony_fake_year(colony)
    colony.created_at.year + colony.created_at.min + 10000 - colony.created_at.sec
  end

  def colony_hostility(colony)
    case colony.hostility
    when 0
      "garden of eden"
    when 1..20
      "utopia"
    when 21..40
      "low"
    when 41..60
      "OK"
    when 61..80
      "high"
    when 81..90
      "extreme"
    when 91..99
      "uninhabitable"
    else
      "certain death"
    end
  end

  def colony_owner_name(colony)
    colony.user.email.match(/^(?<username>.+)@/)[:username].capitalize!
  end

  def colony_population(colony)
    number_with_delimiter(colony.population, delimiter: ',')
  end
end
