class V1::CakesController < ApplicationController
    def index
        if @cakes = Cake.all
            render json: { message: "Got all cakes", httpCode: 200, result: @cakes }, status: :ok
        else 
            render json: { message: "INTERNAL_SERVER_ERROR", httpCode: 500 }, status: :internal_server_error
        end
    end

    def create
        @cake = Cake.new(cake_params)

        if @cake.save
            render json: { message: "New cake saved", httpCode: 201, result: @cake}, status: :created
        end
    end

    def destroy
        @cake = Cake.find(params[:id])

        if @cake.present?
            if @cake.destroy
                head(:ok)
            end
        end
    end

    def find_by_flavor
        @cakes = Cake.where(:flavor => params[:flavor])

        if @cakes.present?
            render json: { message: "Returned flavor filter", httpCode: 200, result: @cakes }, status: :ok
        else 
            render json: { message: "NOT_FOUND", httpCode: 404 }, status: :not_found
        end
    end

    private def cake_params 
        params.require(:cake).permit(:title, :description, :image, :flavor, :size, :price, :custom_image, :custom_price, :store_id)
    end
end
