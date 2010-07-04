class CreateShouts < ActiveRecord::Migration
  def self.up
    create_table :shouts do |t|
      t.integer :sender
      t.integer :reciever
      t.string :asin
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :shouts
  end
end
