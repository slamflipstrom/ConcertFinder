class Artist < ActiveRecord::Base
  
  has_many :events
  
  validates :name, length: { minimum: 2 }
end
  
  #TODO
  # has_many :locations, :through => :shows