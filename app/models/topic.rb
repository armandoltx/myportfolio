class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  # scopes
  def self.with_blog
    includes(:blogs).where.not(blogs: { id: nil } ) # it is a join query look for it online
  end
end
