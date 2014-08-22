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
  @all_artists = Artist.all
  erb :"events/events_all"
end
