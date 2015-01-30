class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD

	private

	# If your model is called User
	def after_sign_in_path_for(resource)
	  session["user_return_to"] || root_path
	end

	# Or if you need to blacklist for some reason
	def after_sign_in_path_for(resource)
	  blacklist = [new_user_session_path, new_user_registration_path] # etc...
	  last_url = session["user_return_to"]
	  if blacklist.include?(last_url)
	    root_path
	  else
	    last_url
	  end
	end

=======
>>>>>>> 6c91d9a19701d9a2721e049d0a3709a96c84ca6f
end
