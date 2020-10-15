class Comment < ApplicationRecord
    belongs_to :meme
    belongs_to :user
    validates :content, presence: true, allow_blank: false
end
