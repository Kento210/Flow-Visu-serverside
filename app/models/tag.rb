class Tag < ApplicationRecord
    validates :tagId, uniqueness: true
end
