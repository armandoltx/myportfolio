class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # scopes
  # 1st method
   def self.angular
     where(subtitle: 'Angular')
   end
   # 2nd method
   scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }

   #callbacks
   after_initialize :set_defaults #when the new action is called in the controller

   def set_defaults
    self.main_image ||= "http://via.placeholder.com/400x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
   end

end
