class RenameColumnToUserTasks < ActiveRecord::Migration
  def change
		rename_column  :user_tasks, :project_members_id, :project_member_id
  end
end
