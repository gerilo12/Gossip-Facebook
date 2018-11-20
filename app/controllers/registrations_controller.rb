class RegistrationsController < ApplicationController
  def new
  end




  def create
    userlog=User.find_by(email: params[:registration][:email].downcase)
    if params[:registration][:password] == userlog.password
      login userlog
      redirect_to userlog
      #redirect_to "/users/#{userlog.id}"
    #if user && user.authenticate(params[:registration][:password])

      #redirect_to user
      #Va log l'utilisateur et le rediriger vers la page de l'utilisateur
    else
      #va créer un message d'erreur
    flash.now[:danger] = 'Email ou password invalide'
    render 'new'

    end
  end

  def destroy
    log_out
    redirect_to ''
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
