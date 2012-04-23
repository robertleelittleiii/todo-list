# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
admin = User.new()
admin.name="admin@one.com"
admin.password="password"
admin.save

tasklist = TodoList.new()
tasklist.list_name = "Delete Me Test"
tasklist.list_description = "This a long but elegent description of my task list."
tasklist.save
    
task = Todo.new()
task.name = "Delete Todo Test"
task.description = "This a long but elegent description of my task list."
task.priority = "100"
task.save
     

tasklist.todos << task
tasklist.save

tasklist2 = TodoList.new()
tasklist2.list_name = "Add to Me Test"
tasklist2.list_description = "This a long but elegent description of my task list."
tasklist2.save
  
admin.todo_lists << tasklist
admin.save

admin.todo_lists << tasklist2
admin.save
