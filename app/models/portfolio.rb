class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image

  # scopes
  # 1st method
  def self.angular
   where(subtitle: 'Angular')
  end
  # 2nd method
  scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }

  #callbacks
  after_initialize :set_defaults

  def set_defaults
  self.main_image ||= Placeholder.image_generator(height: '600', width: '400')  # this is the way we use the Placeholder concern
  self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')  # this is the way we use the Placeholder concern
  end
end
