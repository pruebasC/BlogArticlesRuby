class ArticlesController < ApplicationController
   
    before_action :find_article, except:[:new,:create,:index,:user]
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:delete]

    def new
        @article = Article.new
        @article.title = 'Demo1'
    end

    def create
      @article = current_user.articles.create(title: params[:article][:title],content: params[:article][:content])
      render json: @article
    end

    def show
    end

    def index
        @articles = Article.all
    end

    def edit      
    end

    def user
        @user = User.find(params[:user_id]) 
    end

    def update
        @article.update(title: params[:article][:title],content: params[:article][:content])
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end
end
