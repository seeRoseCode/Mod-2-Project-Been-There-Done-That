class UsersController < ApplicationController


    def home
      @users = User.all
      @countries = Country.all
      @visits = Visit.all
    end

    def index
      @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
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


    private
    def user_params
        params.require(:user).permit(:name, :age, :country, :profile_pic, :password, :password_confirmation)
    end

end
