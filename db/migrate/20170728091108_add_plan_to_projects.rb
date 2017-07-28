class AddPlanToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :plan, :text
  end
end
