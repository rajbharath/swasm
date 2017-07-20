class CreateVolunteerships < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteerships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
