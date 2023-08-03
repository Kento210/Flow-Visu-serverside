class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    tags_params = params["_json"] || [params.require(:tag).permit(:tagId, :stepNo, :boothId, :operator, :content)]

    tags_params.each do |tag_param|
      @tag = Tag.new(tag_param.permit(:tagId, :stepNo, :boothId, :operator, :content))

      if @tag.save
        # タグが正常に保存された後、その情報をStatusモデルにも保存します。
        @status = Status.new(tag_param.permit(:tagId, :stepNo, :boothId, :operator, :content).merge(created_at: @tag.created_at))
        unless @status.save
          render json: { error: 'Failed to create status' }, status: :unprocessable_entity
          return
        end
      else
        if @tag.errors.details[:tagId].any? { |detail| detail[:error] == :taken }
          render json: { error: 'TagId and stepNo combination already exists Error:400' }, status: :bad_request
        else
          render json: { error: 'Failed to create tag' }, status: :unprocessable_entity
        end
        return
      end
    end

    render json: { message: 'OK', created_at: @tag.created_at }, status: :ok
  end
end

