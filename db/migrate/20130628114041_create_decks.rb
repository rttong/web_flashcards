class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
    end

    create_table :cards do |t|
      t.string :question, :answer
      t.references :deck
    end
  end
end
