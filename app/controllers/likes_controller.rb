    class LikesController < ApplicationController

    def new
        @user=User.find(current_user.id)
    end

    def create
        @gossip = Gossip.find(params[:gossip_id])
        @like=Like.create!(user_id: current_user.id, gossip_id: @gossip.id)
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end

    def destroy
        @gossip = Gossip.find(params[:gossip_id])
        puts "Ta maman #{@gossip}"
        @like = @gossip.likes.find(params[:id])
        puts "Ta maman #{@like}"
        @like.destroy
        redirect_to "/users/#{current_user.id}/gossips/#{@gossip.id}"
    end
    
end
