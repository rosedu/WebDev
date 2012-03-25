class AddCreatedAtToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :created_at, :datetime
  end

  def self.down
    remove_column :questions, :created_at
  end
end
