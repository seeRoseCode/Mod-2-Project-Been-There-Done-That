class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def show
    if session[:user_id].nil?
      redirect_to login_path
    else
      this_visit
    end
  end

  def new
    if session[:user_id].nil?
      redirect_to login_path
    else
      @visit = Visit.new
      this_user
    end
  end

  def create
    if this_user.points == nil
      this_user.points = 0
    end

    visit_params["country_id"].each do |c|
      if c != ""
         @visit = Visit.create(
          country_id: c.to_i,
          user_id: session[:user_id]
        )
        this_user.points += 10
      end
    end
    this_user.bonus_points
    this_user.save
  redirect_to user_path(session[:user_id])
  end

############################################
  private
  def visit_params
    params.require(:visit).permit( :user_id, :country_id => [])
  end

  def this_visit
    @visit = Visit.find(session[:user_id])
  end

  def this_user
    @user = User.find(session[:user_id])
  end

end#CLASS END
