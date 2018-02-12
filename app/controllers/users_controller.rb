class UsersController < ApplicationController

  def signup
  	new_user = User.new(user_params)
  	if !user_exists(new_user.email)
  		if new_user.save
    		payload = {data: new_user.email}
    		token = JWT.encode payload, nil, 'none'
		  	render status: 200, json: {
		      status: 'SUCCESS', 
		      user: {email: new_user.email, token: token},
					message: 'saved succesfully'
		  	}
		  else
  	  	render status: 401, json: {
		  		status: 'FAILURE',
		  		errors: { global: "server error saving"}
		  		
	  		}
			end  
	  else
	  	render status: 401, json: {
	  		status: 'FAILURE',
	  		errors: { global: "#{new_user.email} : Email already exists"}
  		}
	  end	
  end

  def signin 
  	if user_exists(params[:email])
	  	user = User.find_by(email: params[:email]) 
			if user.password == params[:password]
				puts "GOOD password #{user.password}"
    		payload = {data: user.email}
    		token = JWT.encode payload, nil, 'none'
		  	render status: 200, json: {
		      status: 'SUCCESS', 
		      user: {email: user.email, token: token}, 
		      message: "Authenticated succesfully" 
		  	} 
			else
				catch
			end	
		else
			catch
		end
		rescue
	  	render status: 401, json: {
	      status: 'Unauthorized', 
	      data: {user: {email: params[:email]}}, 
	      message: "Wrong credentials" 
	  	} 
	end		

  private

  def user_exists(email)
		User.where(email: email).exists?
  end

  def user_params
  	params.permit(:email, :password)
  end

end