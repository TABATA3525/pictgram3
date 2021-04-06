class CommentsController < ApplicationController
  def new
    @topic = Topic.find_by(id: params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメント投稿に失敗しました'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
