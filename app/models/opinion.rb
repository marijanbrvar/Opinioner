class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  validates :text, presence: true, length: { maximum: 250, too_long: '250 characters in post is the maximum allowed.' }

  scope :following_opinions, lambda { |user|
                               includes(:user).where('author_id IN (?)',
                                                     (user.followings.map(&:followed_id) << user.id))
                                 .order(created_at: :desc)
                             }
end
