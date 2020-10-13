class Meme < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, allow_blank: false
    scope :safe_for_work, -> { where(nsfw: false) }

    
end
