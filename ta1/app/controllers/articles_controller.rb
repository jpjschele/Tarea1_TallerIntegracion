class ArticlesController < ApplicationController
	before_action :authenticate_adm! , only: [:create, :new, :edit, :destroy ,:update]
	before_action :set_article , except: [:index, :new, :create]
	
	def index
		@articles = Article.unscoped.order("id DESC")
	end

	def show
		@comment = Comment.new
	end

	def new 
		@article = Article.new
	end 

	def create
		@article = Article.new(article_params)
	
		if @article.save 
			redirect_to @article
		else 
			render :new
		end
	end

	def edit
		
	end

	def destroy
		
		@article.destroy
		redirect_to articles_path
	end

	def update 
		

		if @article.update(article_params )
	
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title,:down,:body)
	end

end









