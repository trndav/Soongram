class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [ :show, :index]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def update
        if @article.update(article_param)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render "edit", status: :unprocessable_entity
        end
    end

    def create
        @article = Article.new(article_param)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render "new", status: :unprocessable_entity
        end
        #this code also work redirect_to article_path(@article)
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
    @article = Article.find(params[:id])
    end

    def article_param
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user
            flash[:alert] = "You can edit/delete only your posts."
            redirect_to @article
        end
    end

end