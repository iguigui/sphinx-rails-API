class UsersController < ApplicationController

  def signup

    new_user = User.new(email: params[:email], password: params[:password])
    if new_user.save 
	  	render json: {
	      status: 'SUCCESS', 
	      data: new_user
	  	}
	  else
	  	render json: {
	  		status: 'FAILURE',
	  		data: new_user
	  	}
	  end	
  end

  def signin 
  	user = User.find_by(email: params[:email])
  	if user.password == params[:password]
	  	render json: {
	      status: 'SUCCESS', 
	      data: user,
	      message: "Authenticated succesfully"
	  	} 
	  else
	  	render json: {
	      status: 'Unauthorized', 
	      data: user,
	      message: "wrong password"
	  	}
  	end	
  end

  private

  def user_params
  	params.permit(:email, :password)
  end
end