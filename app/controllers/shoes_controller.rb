class ShoesController < ApplicationController

    def create_shoe
    end

def list_shoes
end

def update_shoes
end

def delete_shoes
end

private

    def create_shoe_params
        params.permit(:name, :qty, :size, :price, :color, :user_id, :description)
    end

    def valid_shoe_seller?
     if  session[:user_type] == 0
        false
     else
        true
    end

end
