class putsController < ApplicationController
    def create
      @put = put.new(put_params)
      if @put.save
        render json: @put, status: :created
      else
        render json: @put.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @put = put.find(params[:id])
      if @put.update(put_params)
        render json: @put
      else
        render json: @put.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def put_params
      params.require(:put).permit(:name, :status)
    end
  end
  