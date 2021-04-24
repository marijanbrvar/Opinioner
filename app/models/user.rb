class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.photo ||= Placeholder.avatar_generator(size: '64', imgno: rand(1..70).to_s)
    self.cover_image ||= Placeholder.image_generator(height: '450', width: '1200')
  end
end
