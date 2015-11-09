class AddUserIdToTasks < ActiveRecord::Migration
  def change
		add_column :tasks, :user_id, :integer, after: :name
		add_index :tasks, :user_id
  end
end
