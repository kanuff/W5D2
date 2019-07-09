class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if params[:post_id]   #If nested route 
        @comment.post_id = params[:post_id] 
    else
        @comment.post_id = Comment.find(params[:comment][:parent_id]).post_id 
    end 

    @comment.user_id = current_user.id 
    if  @comment.save!
      redirect_to post_url(@comment.post_id)
    else
      flash[:error] = @comment.errors.full_messages 
      redirect_to post_url(@comment.post_id)
    end 
  end




  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end 
end
