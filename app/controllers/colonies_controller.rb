class ColoniesController < ApplicationController
  before_action :set_colony, only: [:show, :edit, :update, :destroy]

  def new
    @colony = Colony.new
    @colony.user = current_user
  end

  def create
    @colony = Colony.new(colony_params)
    @colony.user = current_user
    if @colony.save
      redirect_to colony_path(@colony)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @colony.update(colony_params)
      redirect_to colony_path(@colony), notice: 'Colony was successfully updated.'
    else
      render :edit
    end
  end

  def index
    if params[:query].present?
      @colony_search = Colony.global_search( params[:query] )
      @colonies = @colony_search
    else
      puts "No results for your search. Here are other cool galaxies:"
      @colonies = Colony.all
    end
  end

  def show
    # @fake_year = @colony.created_at.year + @colony.created_at.min + 10000 - @colony.created_at.sec
    @booking = Booking.new
  end

  def show_my_colonies
    @colonies = Colony.where(user: current_user)
  end

  def destroy
    @colony.destroy
    redirect_to colonies_path, notice: 'Colony was successfully destroyed.'
  end

  private

  def set_colony
    @colony = Colony.find(params[:id])
  end

  def colony_params
    params.require(:colony).permit(:name, :location, :description, :population, :hostility, :photo)
  end
end
