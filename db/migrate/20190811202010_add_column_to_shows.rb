class AddColumnToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :seasons, :integer
    add_column :shows, :channel, :string
  end
end
