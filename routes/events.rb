# Index
get "/artist/:id/events/index" do
  @all_events = Event.user
  erb :"events/events_index"
end

# New - Shows form to create new Event
get "/artist/:id/events/new" do
  erb :"events/events_new"
end

# Create
post "/events/create" do
  @event = Event.create({title: params[:title], venue_name: params[:venue_name], artist_name: params[:artist_name]})
  erb :"events/events_create"
end

# Edit
get "events/:id/edit" do
  @event = Event.find(params[:id])
  @venues = @event.venue
  erb :"events/events_edit"
end

# Update
post "/events/:id/update" do
  @event = Event.find(params[:id])
  @event.update_attributes({title: params[:title], venue_name: params[:venue_name]})
  erb :"events/events_update"
end

# Delete
get "/events/:id/delete" do
  Event.find(params[:id]).delete
  erb :"events/events_delete"
end

# Show
get "/artist/:id/events" do
  @event = Event.find(params[:id])
  erb :"events/events_show"
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


# Show all events, regardless of user

get "/events" do
  @all_events = Event.all
  @all_artists = Artist.all
  erb :"events/events_all"
end

# # New Event for a pre-existing Artist
# get "/artist/:id/events/new_plus_artist" do
#   @artist = Artist.find(artist_list: params[:id])
#   erb :"events/new_plus_artist"
# end
#
# # Create Event for pre-existing Artist
# post "/artist/:id/events/create_plus_artist" do
#   @artist = Artist.find(params[:id])
#   @event = Event.create({title: params[:title], venue_name: params[:venue_name], artist_name: params[:artist_name]})
#   erb :"events/create_plus_artist"
# end

