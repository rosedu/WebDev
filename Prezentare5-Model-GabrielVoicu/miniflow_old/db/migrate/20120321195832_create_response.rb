class CreateResponse < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.datetime :created_at
      t.string :description
      t.integer :score
      t.integer :user_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :responses
  end
end
