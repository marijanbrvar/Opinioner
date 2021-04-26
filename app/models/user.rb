class User < ApplicationRecord
  before_destroy :remove_followings

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id
  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :full_name, presence: true, length: { minimum: 5, maximum: 20 }

  scope :not_following_opinions, lambda { |user|
                                   includes(:opinions).where('id NOT IN (?)',
                                                             (user.followings.map(&:followed_id) << user.id))
                                     .limit(10).order(created_at: :desc)
                                 }
  scope :not_following_users, lambda { |user|
                                where('id NOT IN (?)',
                                      (user.followings.map(&:followed_id) << user.id)).limit(10)
                                  .order(created_at: :desc)
                              }
  scope :following, ->(user) { where('id IN (?)', user.followings.map(&:followed_id)) }
  scope :followers, ->(user) { where('id IN (?)', user.followers.map(&:follower_id)).limit(5) }

  after_initialize :set_defaults

  private

  def set_defaults
    self.photo ||= Placeholder.avatar_generator(size: '64', imgno: rand(1..70).to_s)
    self.cover_image ||= Placeholder.image_generator(height: '450', width: '1200')
  end

  def remove_followings
    Following.where(followed_id: id).destroy_all
    Following.where(follower_id: id).destroy_all
  end
end
