class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :articles, dependent: :destroy, through: :taggings

    def to_s
        name
    end
end
