class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = Comment.new(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
