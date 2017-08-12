class DeleteDeckFromRound < ActiveRecord::Migration[5.1]
  def change
    remove_column :rounds, :deck_id, :integer
  end
end
