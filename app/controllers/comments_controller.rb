class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params) # we can do it because the relationship between user and comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
