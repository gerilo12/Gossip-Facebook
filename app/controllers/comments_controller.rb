class CommentsController < ApplicationController
    def new
        @user=User.find(current_user.id)
    end

    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment=Comment.create!(user_id: current_user.id, gossip_id: @gossip.id, content: params[:comment][:content])
        puts @comment
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end

    def destroy
        @gossip = Gossip.find(params[:gossip_id])
        @comment = @gossip.comments.find(params[:id])
        @comment.destroy
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end

end
