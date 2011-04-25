class CreateHostels < ActiveRecord::Migration
  def self.up
    create_table :hostels do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :hostels
  end
end
