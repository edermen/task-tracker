class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :login
      t.string   :email
      t.integer  :role_id

      t.timestamps null: false
		end

		create_table   :project_members do |t|
			t.belongs_to :project
			t.belongs_to :user
		end
  end
end
