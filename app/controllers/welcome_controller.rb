class WelcomeController < ApplicationController
  before_action :set_article , except: [:index, :new, :create]

  def index
  	@articles = Article.unscoped.order("id DESC").limit(10)
  	
  end

  def show
		@comment = Comment.new
		
	end


private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title,:down,:body)
	end

end