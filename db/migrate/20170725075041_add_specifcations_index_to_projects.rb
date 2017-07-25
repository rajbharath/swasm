class AddSpecifcationsIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, :specifications, using: :gin
  end
end
