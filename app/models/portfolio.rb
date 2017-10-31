class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,  #that's the name we need to pass in the form
                                allow_destroy: true # to be able to delete technologies in the nested form 
                                reject_if: lambda { |attrs| attrs['name'].blank? } # need to add all attributes in technologies we just have 'name' it is a data validation.. we say if name is blank do not let it create it
  validates_presence_of :title, :body

  #this is for carrierwave in order to upload images
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # scopes
  # 1st method
  def self.angular
   where(subtitle: 'Angular')
 end
  # 2nd method
  scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }

  def self.by_position
    order("position ASC")
  end
end