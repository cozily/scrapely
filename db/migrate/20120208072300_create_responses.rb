class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.string :email
      t.text :body
      t.timestamps
    end
  end

  def self.down
  end
end
