class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 256, too_long: '256 characters in post is the maximum allowed.' }
  belongs_to :user, foreign_key: 'author_id'
end
