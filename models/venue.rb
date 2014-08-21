class Venue < ActiveRecord::Base
  
  has_many :events
end

  
  
  #TODO
  # has_many :bands, :through => :shows