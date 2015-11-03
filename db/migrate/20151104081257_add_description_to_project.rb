class AddDescriptionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text, after: :name
  end
end
