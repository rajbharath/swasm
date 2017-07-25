class AddSpecificationsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :specifications, :hstore
  end
end
