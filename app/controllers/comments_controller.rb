# комментарии к статьям в блоге
class CommentsController < ApplicationController

  before_filter :authenticate_user!

	# реализовано только создание комментариев
	# вывод комментариев происходит в виде вывода статьи
	def create
		@article=Article.find(params[:article_id])
		@article.comments.create(comment_params)
		redirect_to @article
	end

	private

	# разрешение передачи параметров
	def comment_params
  	params.require(:comment).permit(:author, :body)
	end


end
