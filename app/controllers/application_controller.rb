class ApplicationController < ActionController::API
    include ApplicationController::Cookies
    
    wrap_parameters format: []

    # application response body
    def app_response(status_code: 200, message: "Success", body: nil)
        render json: { status: status_code, message: message, body: body }, status: status_code
    end



end
