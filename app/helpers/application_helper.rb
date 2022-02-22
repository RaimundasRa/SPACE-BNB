module ApplicationHelper

  def colony_fake_year(colony)
    colony.created_at.year + colony.created_at.min + 10000 - colony.created_at.sec
  end
end
