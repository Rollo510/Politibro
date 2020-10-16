class Meme < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    scope :safe_for_work, -> { where(nsfw: false) }


    def self.newest_memes
       self.order(created_at: :desc)
    end


end
