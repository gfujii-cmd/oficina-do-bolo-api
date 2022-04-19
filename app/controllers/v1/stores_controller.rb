class V1::StoresController < ApplicationController
    def index
        if @stores = Store.all
            render json: { message: "Got all stores", httpCode: 200, result: @stores }, status: :ok
        else 
            render json: { message: "INTERNAL_SERVER_ERROR", httpCode: 500 }, status: :internal_server_error
        end
    end

    def create
        @store = Store.new(store_params)

        if @store.create
            render json: { message: "Store created", httpCode: 201, result: @store }, status: :created
        else 
            render json: { message: "INTERNAL_SERVER_ERROR", httpCode: 500, result: @store }, status: :internal_server_error
        end
    end

    private def store_params
        params.require(:store).permit(:address, :number, :complement, :district)
    end
end
