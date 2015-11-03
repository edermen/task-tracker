class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :parent_id
      t.string :name, index: true, uniq: true

      t.timestamps null: false
    end
  end
end
