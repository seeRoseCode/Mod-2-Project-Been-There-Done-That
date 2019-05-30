class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def show
    if session[:user_id].nil?
      redirect_to login_path
    else
      @visit = Visit.find(session[:user_id])
    end
  end

  def new
    if session[:user_id].nil?
      redirect_to login_path
    else
      @visit = Visit.new
      @user = User.find(session[:user_id])
    end
  end

  def create
    @user = User.find(session[:user_id])
    if @user.points == nil
      @user.points = 0
    end

    visit_params["country_id"].each do |c|
      if c != ""
         @visit = Visit.create(
          country_id: c.to_i,
          user_id: session[:user_id]
        )
        @user.points += 10
      end
    end
    @user.bonus_points
    @user.save!(validate: false)
  redirect_to user_path(session[:user_id])
  end

############################################
  private
  def visit_params
    params.require(:visit).permit( :user_id, :country_id => [])
  end
end#CLASS END
