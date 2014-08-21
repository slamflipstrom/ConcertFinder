class Artist < ActiveRecord::Base
  
  has_many :events
end
  
  #TODO
  # has_many :locations, :through => :shows