class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id
    end
  end
end
