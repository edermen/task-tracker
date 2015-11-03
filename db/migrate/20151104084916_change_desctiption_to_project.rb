class ChangeDesctiptionToProject < ActiveRecord::Migration
  def change
		change_column_null :projects, :description, false
		change_column_null :projects, :name, false
  end
end
