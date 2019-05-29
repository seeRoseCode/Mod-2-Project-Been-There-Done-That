class UsersController < ApplicationController

    def home
      @users = User.all
      @countries = Country.all
      @visits = Visit.all
    #   redirect_to login_path
    end

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
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.profile_pic = params["user"][:profile_pic]
      @user.age = params["user"][:age]
      if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          render :edit
      end
    end


    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
    end


    private
    def user_params
        params.require(:user).permit(:name, :age, :country, :profile_pic, :password, :password_confirmation)
    end

end
