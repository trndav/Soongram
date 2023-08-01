class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
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

end