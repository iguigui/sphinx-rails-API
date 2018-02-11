class UsersController < ApplicationController

  def signup
  	new_user = User.new(email: params[:email], password: params[:password])
  	if !user_exists(new_user.email)
  		if new_user.save
		  	render json: {
		      status: 'SUCCESS', 
		      data: {user: new_user, message: 'saved succesfully'}
		  	}
		  else
  	  	render json: {
		  		status: 'FAILURE',
		  		data: {email: new_user.email, message: 'Error saving'}
	  		}
			end  
	  else
	  	render json: {
	  		status: 'FAILURE',
	  		data: {email: new_user.email, message: 'Email already exists'}
  		}
	  end	
  end

  def signin 
  	puts params[:email]
  	puts user_exists(params[:email])
  	if user_exists(params[:email])
	  	user = User.find_by(email: params[:email]) 
			if user.password == params[:password]
				puts "GOOD password #{user.password}"
				# token = JsonWebToken.encode({user_id: user.id}),
    #   		user: {id: user.id, email: user.email}
		  	render json: {
		      status: 'SUCCESS', 
		      data: {user: {email: user.email}}, 
		      message: "Authenticated succesfully" 
		  	} 
			else
				catch
			end	
		else
			catch
		end
		rescue
	end		
				
  # 	if user_exists(params[:email])
	 #  	user = User.find_by(email: params[:email])
	 #  	if user.password == params[:password]
		#   else
		#   	catch
		#   end
		# else 
		# 	catch  
		# end  
		# rescue
	 #  	render json: {
	 #      status: 'Unauthorized', 
	 #      data: user,
	 #      message: "Wrong credentials"
	 #  	}  	
  # end

  private

  def user_exists(email)
		User.where(email: email).exists?
  end

  def user_params
  	params.permit(:email, :password)
  end

end