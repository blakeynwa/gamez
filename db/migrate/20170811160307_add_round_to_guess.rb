class AddRoundToGuess < ActiveRecord::Migration[5.1]
  def change
    add_column :guesses, :round_id, :integer
  end
end
