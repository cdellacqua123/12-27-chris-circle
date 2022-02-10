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
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages, status: 422
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        if user.destroy
            flash[:errors] = ['User destroyed or deleted or something like that']
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
        params.require(:user).permit(:username, :email, :country, :age, :password)
    end
end
