class Meme < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, allow_blank: false, format: {
        with: %r{\.(gif|jpe?g|png)\z}i,
        message: 'must link to a GIF, JPG, or PNG image'}
    validates :description, presence: true, allow_blank: false
    scope :safe_for_work, -> { where(nsfw: false) }
    default_scope { order(created_at: :desc) }
    accepts_nested_attributes_for :comments


end
