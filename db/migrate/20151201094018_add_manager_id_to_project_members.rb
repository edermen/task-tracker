class AddManagerIdToProjectMembers < ActiveRecord::Migration
  def change
    add_column :project_members, :manager_id, :integer, after: :user_id
  end
end
