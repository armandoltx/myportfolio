class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  # scopes
  # 1st method
   def.self.angular
     where(subtitle: 'Angular')
   end
   # 2nd method
   scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }
     
end
