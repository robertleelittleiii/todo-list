class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.date :completion_date
      t.boolean :completed
      t.integer :user_id
      t.integer :todo_list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
 