module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "http://placeimg.com/#{width}/#{height}/any"
  end

  def self.avatar_generator(size:, imgno:)
    "https://i.pravatar.cc/#{size}?img=#{imgno}"
  end
end
