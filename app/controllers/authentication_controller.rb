class AuthenticationController < ApplicationController

    def crete_account
        user = User.create(create_params)
        if user.valid?
            create_user_session(user_id, user.user_type)
            app_response(status_code: 201, message:"Account created successfully", body: user)
        else
            app_response(status_code: 422, message: "Invalid Input", body: user.errors.full_messages)
    end

    def login_account
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            create_user_session(user_id, user.user_type)
            app_response(status_code: 200, message: "Login Successfully", body: user)
        else
            app_response(status_code: 401, message: "Invalid username or password", body: user)
        end
    end


    private

    def create_params
        params.permit(:name, :email, :password, :display_picture, :user_type)
    end

    def create_user_session user_id, user_type
        #create session everytime user is authenticated
        session[:user_id] ||= user_id    
        session[:user_type] ||= user_type   
    end
    

end
