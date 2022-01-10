class RemoveReleaseMonthFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :release_month, :text
  end
end
