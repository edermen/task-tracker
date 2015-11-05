class AddMissingThings < ActiveRecord::Migration
  def change
		# Add timestamps
		add_timestamps :project_members
		add_timestamps :user_tasks

		# add indexes
		add_index :project_members, [:project_id, :user_id], unique: true
		add_index :projects, :parent_id
		add_index :user_tasks, [:task_id, :project_member_id], unique: true
		add_index :users, [:email, :role_id], unique: true
  end
end
