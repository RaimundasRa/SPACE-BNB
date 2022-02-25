module ApplicationHelper

  def colony_fake_year(colony)
    # number_with_delimiter(colony.population, delimiter: ',')
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

  def colony_photo(colony)
  end

  def colony_photo_url(colony)
    if colony.photo.attached?
      cloudinary_url(colony.photo.key)
    else
      'https://res.cloudinary.com/dqat8a2hi/image/upload/v1645788291/Space-BNB/wp1923649_ih89r9.jpg'
    end
  end
end
