class StatusesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @statuses = Status.all
    render json: { data: @statuses }, status: :ok
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    render json: { message: 'Status deleted' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Status not found' }, status: :not_found
  end
end

