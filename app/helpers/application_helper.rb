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

  def random_activities(count)
    activities = [
      {name: 'Hunting Ewoks',
      description: 'Shoot some ewoks',
      image_url:'https://mtv.mtvnimages.com/uri/mgid:file:http:shared:mtv.com/news/wp-content/uploads/2015/09/Ewok-1441395870.jpg?quality=.8&height=632.8089887640449&width=800'},

      {name: 'Getting mugged',
      description: 'How\'s your appetite to risk?',
      image_url:'https://livesafely.org/media/posts/123/avoid-being-mugged.jpg'},

      {name: 'Fishing in lake Quaglon',
      description: 'There\'s pleanty of fish in the sea',
      image_url:'https://imageio.forbes.com/specials-images/imageserve/615f7a84c4048b29616d55d6/A-person-fishing-from-a-boat-at-Islands-of-Loreto-/960x0.jpg?fit=bounds&format=jpg&width=960'},

      {name: 'Space Walks',
      description: 'Explore nearby asteroids and go space-drifting, tethered to a drone! <strong>fun AND dangerous!</strong>',
      image_url:'https://res.cloudinary.com/dqat8a2hi/image/upload/v1645620922/Space-BNB/banner_activities_jh28z5.jpg'},

      {name: 'Space Racing',
      description: 'Test your skills on the v-track in our specialised racing craft! full training provided. <strong>Thrilling!</strong>',
      image_url:'https://res.cloudinary.com/dqat8a2hi/image/upload/v1645621856/Space-BNB/outer-space-normandy-stars-planets-rings-spaceships-science-fiction-vehicles-wide-resolution-1080P-wallpaper-middle-size_whytac.jpg'},

      {name: 'GWWF Wrestling',
      description: 'Galactic Wookie Wrestling Federation - fancy yourself as a hard man? do you say \'whats your boggle mate?!\' prior to a bar fight? try your luck in the ring with a wrestling wookie. <strong>Life-Changing.</strong>',
      image_url:'https://res.cloudinary.com/dqat8a2hi/image/upload/v1645621997/Space-BNB/maxresdefault_xn4qy8.jpg'}
      ]

    activities.shuffle.first(count)
  end
end
