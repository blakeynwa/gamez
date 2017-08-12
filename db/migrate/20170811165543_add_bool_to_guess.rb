class AddBoolToGuess < ActiveRecord::Migration[5.1]
  def change
    add_column :guesses, :correctness, :boolean
  end
end
