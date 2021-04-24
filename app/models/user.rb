class User < ApplicationRecord
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Following'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Following'
  has_many :following, through: :following_relationships, source: :following

  has_many :opinions, foreign_key: 'author_id'

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :full_name, presence: true, length: { minimum: 5, maximum: 20 }

  after_initialize :set_defaults

  def set_defaults
    self.photo ||= Placeholder.avatar_generator(size: '64', imgno: rand(1..70).to_s)
    self.cover_image ||= Placeholder.image_generator(height: '450', width: '1200')
  end
end
