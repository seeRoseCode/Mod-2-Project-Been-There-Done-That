class SessionsController < ApplicationController
    def new
    end

    # def create
    #     @user = User.find_by(name: session_params[:name])
    #     return head(:forbidden) unless @user.authenticate(session_params[:password])
    #     session[:user_id] = @user.id
    # end
    # Used to login as an already created user
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else  
            redirect_to new_session_path
        end
    end

    private
    def session_params
        params[:user]
    end
end
