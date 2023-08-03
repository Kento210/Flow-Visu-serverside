class Tag < ApplicationRecord
    validates :tagId, uniqueness: { scope: :stepNo, message: "errer:400" }
end
