class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :field
      t.datetime :start_at
      t.string :opponent
      t.integer :home_score
      t.integer :away_score
      t.string :win_loss

      t.timestamps
    end
  end
end
