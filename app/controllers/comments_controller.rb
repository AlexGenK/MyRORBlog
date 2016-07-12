class CommentsController < ApplicationController

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
