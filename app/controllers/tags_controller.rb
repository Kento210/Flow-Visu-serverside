class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      # タグが正常に保存された後、その情報をStatusモデルにも保存します。
      @status = Status.new(tag_params)
      if @status.save
        render json: { message: 'OK', status: @status }, status: :ok
      else
        render json: { error: 'Failed to create status' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Failed to create tag' }, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:tagId, :stepNo, :boothId, :operator, :content)
  end
end

  
