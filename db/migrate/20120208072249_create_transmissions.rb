class CreateTransmissions < ActiveRecord::Migration
  def self.up
    create_table :transmissions do |t|
      t.integer :post_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :transmissions
  end
end
