class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end
    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "You have updated your account #{@user.username}."
            redirect_to user_path(@user)
        else
            render "edit"
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Soongram #{@user.username}, you are registered now."
            redirect_to articles_path
        else render "new", status: :unprocessable_entity
        end
    end
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end