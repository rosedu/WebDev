class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
    end

    %w[ ruby sinatra web development ].each do |category|
      Category.create :name => category
    end
  end

  def self.down
    drop_table :categories
  end
end
