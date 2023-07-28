class StatusesController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      @statuses = Status.all
      render json: { data: @statuses }, status: :ok
    end
  end
  
