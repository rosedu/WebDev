class CreateUrls < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :original, :null => false
      t.string :slug,     :null => false, :limit => 20
      
      t.timestamps
    end
    
    add_index :urls, :slug    
  end

  def down
    drop_table :urls
  end
end
