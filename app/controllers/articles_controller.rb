# статьи в блоге
class ArticlesController < ApplicationController

  # за исключением просмотра, все остальные действия требуют аутентификации пользователя
  before_action :authenticate_user!, :except => [:show, :index]

	def new
	end

  def index
    @articles=Article.order(:updated_at).reverse
  end

  def show
    @article=Article.find(params[:id])
    @comments=@article.comments.order(:created_at).reverse
  end

 	def create
    @article=Article.new(article_params)

    # если статью удается записать, то выводится записанная статья, иначе - снова форма создания статьи
    if @article.save then
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

    # если статью удается записать, то выводится записанная статья, иначе - снова форма редактирования статьи
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

  # разрешение передачи парметров
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
