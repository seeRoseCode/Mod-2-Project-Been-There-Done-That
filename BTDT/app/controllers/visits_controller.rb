class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(session[:user_id])
  end

  def new
    @visit = Visit.new
    @user = User.find(session[:user_id])
  end

  def create
    visit_params["country_id"].each do |c|
      if c != ""
        @visit = Visit.create(
          country_id: c.to_i,
          user_id: session[:user_id]
        )
      end
    end
  redirect_to user_path(session[:user_id])
  end

############################################
  private
  def visit_params
    params.require(:visit).permit( :user_id, :country_id => [])
  end
end
