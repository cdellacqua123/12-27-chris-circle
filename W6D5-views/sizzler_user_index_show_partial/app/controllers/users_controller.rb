class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])
        if user.destroy
            render json: ['User destroyed or deleted or something like that', user]
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to "/users/#{@user.id}"
            # render json: user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :country, :age)
    end
end
