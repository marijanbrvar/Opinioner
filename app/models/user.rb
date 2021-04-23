class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.photo ||= Placeholder.image_generator(height: '75', width: '75')
    self.cover_image ||= Placeholder.image_generator(height: '900', width: '250')
  end
end
