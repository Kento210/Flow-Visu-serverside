class StatusesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @statuses = Status.select(:tagId, :stepNo, :boothId, :operator, :content, :created_at).distinct
    render json: { data: @statuses }, status: :ok
  end
end

  
