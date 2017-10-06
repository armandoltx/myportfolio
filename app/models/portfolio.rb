class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? } # need to add all attributes in technologies we just have 'name' it is a data validation.. we say if name is blank do not let it create it
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
