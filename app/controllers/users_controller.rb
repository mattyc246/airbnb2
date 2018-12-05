class UsersController < ApplicationController
 
  def show
    @user = User.find(current_user.id)
  end

  def create

    user = User.new(user_params)

    if user.save

      flash[:success] = "You have successfully created an account!"
      redirect_to root_path 

    else
    
      flash[:danger] = "Unable to create new account!"
      redirect_to sign_up_path

    end 

  end

  def update

    user = User.find(params[:id])

    if user.update(user_params)

      flash[:success] = "You have successfully updated details!"
      redirect_to user_path(user.id)

    else

      flash[:danger] = "Unable to update details, please check & try again!"
      redirect_to user_path(user.id)

    end

  end

  def destroy

    user = User.find(params[:id])

    if user.destroy

      flash[:success] = "You have successfully removed your account with us!"
      sign_out

    else

      flash[:danger] = "Unable to remove account, please check your privileges!"
      redirect_to user_path(current_user.id)

    end
    
  end


  private

    def user_params

      params.require(:user).permit(:full_name, :email, :password, :address_line1, :city, :state, :country, :postcode, :phone_number, :photo)

    end

end
