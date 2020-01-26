class ArticlesController < ApplicationController

    include ArticlesHelper
    before_action :require_login, except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @article.increment_view_count
        @comment = Comment.new
        @comment.article_id = @article.id
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
	def create
        @article = Article.new(article_params)
        @article.view_count = 0
		@article.author_id = current_user.id
		@article.save
		
		flash.notice = "Article '#{@article.title}' created!"
		redirect_to article_path(@article)
	end
  
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!"
        redirect_to article_path(@article)
    end
   
    def destroy
        @article = Article.find(params[:id])
        

        @article.tags.each do |tag|
            if tag.taggings.count == 1
              @tag = Tag.find(tag.id)
              @tag.destroy
            end
        end
        
        @article.destroy
        flash.notice = "Article '#{@article.title}' deleted!"
        redirect_to articles_path(@articles)
    end

 end
