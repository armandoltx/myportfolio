module Placeholder
  extend ActiveSupport::concern
  
  def self.image_generator(height:, width:)
   "http://via.placeholder.com/#{height}x#{width}"
  end
end
