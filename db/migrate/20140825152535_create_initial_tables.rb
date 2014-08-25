class CreateInitialTables < ActiveRecord::Migration
  def change
    
    # ActiveRecord adds the ID column and sets it as the primary key automatically.
    
       # Important rules:
       #
       # 1. Never edit a migration after it's been run via `rake db:migrate`.
       # 2. Never edit db/schema.rb directly.
       # 3. Never edit table structure via the DB console.
    
       create_table :events do |t|
         t.string :title
         t.integer :artist_id
         t.string :artist_name
         t.integer :venue_id
         t.string :venue_name
         t.datetime :created_at
       end
    
       create_table :venues do |t|
         t.string :name
         t.string :city
         t.string :country
         t.decimal :latitude
         t.decimal :longitude
         t.string :region
       end
    
       create_table :artists do |t|
         t.string :name
         t.string :image_url
         t.string :thumb_url
       end
     end
   end