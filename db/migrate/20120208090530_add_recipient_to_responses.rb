class AddRecipientToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :recipient, :string
  end

  def self.down
    remove_column :responses, :recipient
  end
end
