class RenameImageToImageNameInProjects < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :image, :image_before
  end
end
