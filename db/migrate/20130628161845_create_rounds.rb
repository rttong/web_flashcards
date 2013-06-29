class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.integer :correct, default: 0
      t.integer :incorrect, default: 0
    end
  end
end
