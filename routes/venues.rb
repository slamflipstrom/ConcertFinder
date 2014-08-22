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