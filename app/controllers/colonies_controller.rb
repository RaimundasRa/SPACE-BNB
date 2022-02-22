class ColoniesController < ApplicationController
  def index
    @colonies = Colony.all
  end

  def show
    @colony = Colony.find(params[:id])
    @fake_year = @colony.created_at.year + @colony.created_at.min + 10000 - @colony.created_at.sec
  end
end
