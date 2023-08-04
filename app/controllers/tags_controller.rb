class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    tags_params = params["_json"] || [params.require(:tag).permit(:tagId, :stepNo, :boothId, :operator, :content)]

    tags_params.each do |tag_param|
      @tag = Tag.find_or_initialize_by(tagId: tag_param[:tagId])

      if @tag.new_record? || @tag.stepNo != tag_param[:stepNo]
        @tag.assign_attributes(tag_param.permit(:stepNo, :boothId, :operator, :content))

        if @tag.save
          # タグが正常に保存された後、その情報をStatusモデルにも保存します。
          # まず、同じtagIdの既存のStatusレコードを削除します。
          Status.where(tagId: @tag.tagId).destroy_all

          @status = Status.new(tag_param.permit(:tagId, :stepNo, :boothId, :operator, :content).merge(created_at: @tag.created_at))
          unless @status.save
            render json: { error: 'Failed to create status' }, status: :unprocessable_entity
            return
          end
        else
          render json: { error: 'Failed to create or update tag' }, status: :unprocessable_entity
          return
        end
      else
        render json: { error: 'TagId and stepNo combination already exists Error:400' }, status: :bad_request
        return
      end
    end

    render json: { message: 'OK', created_at: @tag.created_at }, status: :ok
  end
end


