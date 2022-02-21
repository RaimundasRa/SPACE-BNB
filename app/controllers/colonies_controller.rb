class ColoniesController < ApplicationController
  def index
    @colonies = Colony.all
  end

  def show
    @colony = Colony.find(params[:id])
  end
end
