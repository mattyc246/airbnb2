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

  end

  def destroy

  end


  private

    def user_params

      params.require(:user).permit(:full_name, :email, :password, :address_line1, :city, :state, :country, :postcode, :phone_number)

    end

end
