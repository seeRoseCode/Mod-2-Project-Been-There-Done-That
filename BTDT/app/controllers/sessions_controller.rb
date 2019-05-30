class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Logged in!"
        else
            flash[:alert] = "Username or password invalid"
            redirect_to login_path
        end
    end

    def destroy 
        session[:user_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end 
end
