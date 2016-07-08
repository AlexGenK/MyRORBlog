class ArticlesController < ApplicationController

	def new
	end

  def index
    @articles=Article.order(:updated_at).reverse
  end

  def show
    @article=Article.find(params[:id])
  end

 	def create
    @article=Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render action: 'new' 
    end
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
