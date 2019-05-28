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
    @visit = Visit.create(visit_params)
    if @visit.save
      redirect_to visit_path(@visit)
    else
      render :new
    end
  end

  private
  def visit_params
    params.require(:visit).permit( :user_id, :country_id => [])
  end
end
