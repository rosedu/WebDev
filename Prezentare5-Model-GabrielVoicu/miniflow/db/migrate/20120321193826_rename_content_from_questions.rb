class RenameContentFromQuestions < ActiveRecord::Migration
  def self.up
    rename_column :questions, :content, :description
  end

  def self.down
    rename_column :questions, :description, :content
  end
end
