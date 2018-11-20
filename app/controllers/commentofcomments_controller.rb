class CommentofcommentsController < ApplicationController
    def new
        @user=User.find(current_user.id)

    end

    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.find(params[:comment_id])
        @commentofcomment=Commentofcomment.create!(user_id: current_user.id, comment_id: @comment.id, content: params[:commentofcomment][:content])
        puts @commentofcomment
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end

    def destroy
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.find(params[:comment_id])
        @commentofcomment = @comment.commentofcomments.find(params[:id])
        @commentofcomment.destroy
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end

end


