class CommentsController < ApplicationController

def create
  @article = Article.friendly_id.find_by(slug: params[:article_slug])
  if @article
  @comment = @article.comments.create(comment_params)
  redirect_back(fallback_location: article_path(@article))
  else
# Обработка ошибки, если статья не найдена
    flash[:error] = "Статья не найдена"
    redirect_to root_path
end
end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end

