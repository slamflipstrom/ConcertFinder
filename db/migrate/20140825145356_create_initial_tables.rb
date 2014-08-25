class CreateInitialTables < ActiveRecord::Migration
  def change
    
    # ActiveRecord adds the ID column and sets it as the primary key automatically.
    
       # Important rules:
       #
       # 1. Never edit a migration after it's been run via `rake db:migrate`.
       # 2. Never edit db/schema.rb directly.
       # 3. Never edit table structure via the DB console.
    

  end
end
