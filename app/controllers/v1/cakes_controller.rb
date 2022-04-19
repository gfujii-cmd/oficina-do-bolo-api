class V1::CakesController < ApplicationController
    def index
        if @cakes = Cake.all
            render json: { message: 'Got all cakes', httpCode: 200, result: @cakes }, status: :ok
        else 
            render json: { message: 'INTERNAL_SERVER_ERROR', httpCode: 500 }, status: 500
        end
    end

    private def cake_params 
        params.require(:cake).permit(:title, :description, :image, :flavor, :size, :price, :custom_image, :custom_price)
    end
end
