class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :guess
      t.integer :card_id
      t.timestamps
    end
  end
end
