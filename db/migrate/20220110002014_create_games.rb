class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :platform
      t.text :release_month

      t.timestamps
    end
  end
end
