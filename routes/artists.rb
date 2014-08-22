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
