class UsersController < ApplicationController

  def new
    @user=User.new
  end

   def create    
    @user = User.create(user_params)
    login @user
    flash.now[:success] = "C'est good !"
    redirect_to user_path(@user.id)
  end

  def show
    @user=User.find(params[:id])
    puts params
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
