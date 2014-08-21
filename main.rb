
require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

# require "bandsintown"

# Bandsintown.app_id = 'YOUR_APP_ID'

require_relative "./models/artist.rb"
require_relative "./models/event.rb"
require_relative "./models/venue.rb"

#TODO
# Index

get "/" do 
  
  erb :home
end

get "/artist/index" do
  @all_artists = Artist.all # This is a class-method that we made.
  erb :artists_index
end

# New
get "/artist/new" do
  erb :artists_new  
end

# Create
post "/artist/create" do
  @artist = Artist.create({name: params[:name]})
  erb :artists_create
end

# Edit
get "/artist/:id/edit" do
  @all_artists = Artist.all
  @artist = Artist.find(params[:id])
  erb :artists_edit
end

# Update
post "/artist/:id/update" do
  @artist = Artist.find(params[:id])
  @artist.update_attributes({id: params[:id], name: params[:name]})
  end
  
#   erb :artists_update
# end

# Delete
get "/artist/:id/delete" do
  Artist.find(params[:id]).delete
  erb :artists_delete
end

# Show
get "/artist/:id" do
  @artist = Artist.find(params[:id])
  erb :artists_show
end

# -------------------------------------------------------------------

# Index
get "/events/index" do
  @all_events = Event.all
  erb :events_index
end

# New
get "/events/new" do
  @all_events = Event.all
  erb :events_new
end

# TODO Consider adding
# get "/events/new_plus_venues" do
#   erb :event_new_plus_venues
# end

# TODO Consider adding8
# event "/events/create_plus_venues" do
#   @event = Event.create({title: params[:title], venue_id: params[:venue_id]})
#   @event.create_venue({name: params[:venue_name], city: params[:city]})
#   @event.save
#   erb :event_create_plus_venues
# end

# Create
post "/events/create" do
  @event = Event.create({title: params[:title], venue_name: params[:venue_name], artist_name: params[:artist_name]})
  erb :events_create
end

# Edit
get "/events/:id/edit" do
  @event = Event.find(params[:id])
  erb :events_edit
end

# Update
post "/events/:id/update" do
  @event = Event.find(params[:id])
  @event.update_attributes({title: params[:title], venue_name: params[:venue_name], artist_name: params[:artist_name]})
  erb :events_update
end

# Delete
get "/events/:id/delete" do
  Event.find(params[:id]).delete
  erb :events_delete
end

# Show
get "/events/:id" do
  @event = Event.find(params[:id])
  erb :events_show
end

# -------------------------------------------------------------------

# Index
get "/venues/index" do
  @all_venues = Venue.all # This is a class-method that we made.
  erb :venues_index
end

# New
get "/venues/new" do
  erb :venues_new
end

# Create
post "/venuess/create" do
  @venues = Venue.create({name: params[:name], city: params[:city], country: params[:country]})
  erb :venues_create
end

# Edit
get "/venues/:id/edit" do
  @venues = Venue.find(params[:id])
  erb :venues_edit
end

# Update
post "/venues/:id/update" do
  @venues = Venue.find(params[:id])
  @venues.update_attributes({name: params[:name], city: params[:city], country: params[:country]})
  erb :venues_update
end

# Delete
get "/venues/:id/delete" do
  Venue.find(params[:id]).delete
  erb :venues_delete
end

# Show
get "/venues/:id" do
  @venues = Venue.find(params[:id])
  erb :venues_show
end