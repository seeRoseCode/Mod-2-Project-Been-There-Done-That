class VisitsController < ApplicationController

  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      redirect_to vist_path(@visit)
    else
      render :new
    end
  end

  private
  def visit_params
    params.require(:visit).permit(:name, :language, :flag_emoji)
  end


end
