
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

binding.pry

get "/artist/index" do
  @all_artists = Artist.all # This is a class-method that we made.
  erb :"artists/artists_index"
end

# New
get "/artist/new" do
  erb :"artists/artists_new"  
end

# Create
post "/artist/create" do
  @artist = Artist.create({name: params[:name]})
  erb :"artists/artists_create"
end



# Edit
get "/artist/:id/edit" do
  @all_artists = Artist.all
  @artist = Artist.find(params[:id])
  erb :"artists/artists_edit"
end

# Update
post "/artist/:id/update" do
  @artist = Artist.find(params[:id])
  @artist.update_attributes({id: params[:id], name: params[:name]})
  
  erb :"artists/artists_update"
end

# Delete
get "/artist/:id/delete" do
  Artist.find(params[:id]).delete
  erb :"artists/artists_delete"
end

# Show
get "/artist/:id" do
  @artist = Artist.find(params[:id])
  erb :"artists/artists_show"
end

# -------------------------------------------------------------------

# Index
get "/artist/:id/events/index" do
  @all_events = Event.user
  erb :"events/events_index"
end

# New
get "/artist/:id/events/new" do
  @all_events = Event.user
  erb :"events/events_new"
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
post "/artist/:id/events/create" do
  @event = Event.create({title: params[:title], venue_name: params[:venue_name]})
  erb :"events/events_create"
end

# Edit
get "/artist/:id/events/:id/edit" do
  @event = Event.find(params[:id])
  @venues = @event.venue
  erb :"events/events_edit"
end

# Update
post "/artist/:id/events/:id/update" do
  @event = Event.find(params[:id])
  @event.update_attributes({title: params[:title], venue_name: params[:venue_name]})
  erb :"events/events_update"
end

# Delete
get "/artist/:id/events/:id/delete" do
  Event.find(params[:id]).delete
  erb :"events/events_delete"
end

# Show
get "/artist/:id/events/:id" do
  @event = Event.find(params[:id])
  erb :"events/events_show"
end

# Show all events, regardless of user

get "/events" do
  @all_events = Event.all
  erb :"events/events_all"
end

# -------------------------------------------------------------------

# Index
get "/venues/index" do
  @all_venues = Venue.all # This is a class-method that we made.
  erb :"venues/venues_index"
end

# New
get "/venues/new" do
  erb :"venues/venues_new"
end

# Create
post "/venues/create" do
  @venues = Venue.create({name: params[:name], city: params[:city], country: params[:country]})
  erb :"venues/venues_create"
end

# Edit
get "/venues/:id/edit" do
  @venues = Venue.find(params[:id])
  erb :"venues/venues_edit"
end

# Update
post "/venues/:id/update" do
  @venues = Venue.find(params[:id])
  @venues.update_attributes({name: params[:name], city: params[:city], country: params[:country]})
  erb :"venues/venues_update"
end

# Delete
get "/venues/:id/delete" do
  Venue.find(params[:id]).delete
  erb :"venues/venues_delete"
end

# Show
get "/venues/:id" do
  @venues = Venue.find(params[:id])
  erb :"venues/venues_show"
end