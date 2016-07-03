class ArticlesController < ApplicationController

	def new
	end

  def index
    @articles=Article.order(:updated_at)
  end

  def show
    @article=Article.find(params[:id].to_i)
  end

 	def create
    # render plain: params[:article].inspect
    @article=Article.new(article_params)
    if @article.valid?
      @article.save
    else
      render action: 'new' 
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
