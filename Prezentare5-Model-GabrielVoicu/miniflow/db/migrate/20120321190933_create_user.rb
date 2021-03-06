class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :users
  end
end
