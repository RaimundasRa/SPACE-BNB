class ColoniesController < ApplicationController
  before_action :set_colony, only: [:show]

  def new
    @colony = Colony.new
    @colony.user = current_user
  end

  def create
    @colony = Colony.new(colony_params)
  end

  def index
    @colonies = Colony.all
  end

  def show
    @fake_year = @colony.created_at.year + @colony.created_at.min + 10000 - @colony.created_at.sec
  end

  def show_my_colonies
    @colonies = Colony.where(user: current_user)
  end

  private

  def set_colony
    @colony = Colony.find(params[:id])
  end

  def colony_params
    params.require(:colony).permit(:name, :location, :description, :population, :hostility, :user, :photo)
  end
end
