class Event < ActiveRecord::Base
  
  belongs_to :venues
  belongs_to :artists
  
end