class AddLocationIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, :location, using: :gist
  end
end
