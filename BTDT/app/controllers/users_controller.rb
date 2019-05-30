class UsersController < ApplicationController

    def home
        # byebug
      @users = User.all
      @rank_by_points = User.sort_by_points[0..4]
      @rank_by_countries = User.sort_by_countries[0..4]
      @most_visited_countries = Country.sort_by_visits[0..9]
    end
    #   redirect_to login_path

    def index
      @users = User.all
    end

    def new
        @user = User.new
    end

    def login
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.points = 0
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end


    def show
      @user = User.find(params[:id])
      @posts = @user.posts[0..4]
    end

    def edit
      current_user
    end

    def update#BUG######################################################
      current_user.profile_pic = params["user"][:profile_pic]
      current_user.age = params["user"][:age]
      current_user.country_of_origin = params["user"][:country_of_origin]
      if current_user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          render :edit
      end
    end


    def destroy
      current_user.destroy
      session.destroy
      redirect_to home_path
    end


    private
    def user_params
        params.require(:user).permit(:name, :age, :country_of_origin, :profile_pic, :password, :password_confirmation)
    end

end
