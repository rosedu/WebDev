class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :description
      t.integer :rating
      t.string :user_id
      t.integer :question_id
      t.integer :category_id
    end
  end

  def self.down
    drop_table :questions
  end
end
