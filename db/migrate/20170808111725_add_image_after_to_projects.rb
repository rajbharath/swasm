class AddImageAfterToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :image_after, :string
  end
end
