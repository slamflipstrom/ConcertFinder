require "rubygems"
require "bundler"

Bundler.require

# Bandsintown.app_id = 'YOUR_APP_ID'

require_relative "./models/artist.rb"
require_relative "./models/event.rb"
require_relative "./models/venue.rb"
require_relative "./routes/artists.rb"
require_relative "./routes/events.rb"
require_relative "./routes/venues.rb"


get "/" do 
  
  erb :home
end

