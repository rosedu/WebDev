class CreateQuestionsCategories < ActiveRecord::Migration
  def self.up
    create_table :question_categories do |t|
      t.integer :category_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :question_categories
  end
end
