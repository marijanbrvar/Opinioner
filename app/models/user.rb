class User < ApplicationRecord
  validates_presence_of :username, :full_name

  after_initialize :set_defaults
  
  def set_defaults
    self.photo ||= Placeholder.image_generator(height: '150', width: '150')
    self.cover_image ||= Placeholder.image_generator(height: '900', width: '250')
  end
end
