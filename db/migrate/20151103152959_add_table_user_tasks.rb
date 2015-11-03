class AddTableUserTasks < ActiveRecord::Migration
  def change
		create_table :user_tasks do |t|
			t.integer :task_id
			t.belongs_to :project_members
		end
  end
end
