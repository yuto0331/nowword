class Voice < ApplicationRecord
    validates :content, presence: true
    validates :content, presence: true, length: { minimum: 1, maximum: 140 }
end
