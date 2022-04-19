class V1::StoresController < ApplicationController
    def index
        if @stores = Store.all
            render json: { message: "Got all stores", httpCode: 200, result: @cakes }, status: :ok
        else 
            render json: { message: "INTERNAL_SERVER_ERROR", httpCode: 500, result: @cakes }, status: :internal_server_error
        end
    end

    def create

    end

    private def store_params
        params.require(:store).permit(:address, :number, :complement, :district)
    end
end
