require 'spec_helper'

describe "todos/new.html.erb" do
  before(:each) do
    assign(:todo, stub_model(Todo,
      :name => "MyString",
      :description => "MyText",
      :priority => 1,
      :completed => false,
      :user_id => 1,
      :todo_list_id => 1
    ).as_new_record)
  end

  it "renders new todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path, :method => "post" do
      assert_select "input#todo_name", :name => "todo[name]"
      assert_select "textarea#todo_description", :name => "todo[description]"
      assert_select "input#todo_priority", :name => "todo[priority]"
      assert_select "input#todo_completed", :name => "todo[completed]"
      assert_select "input#todo_user_id", :name => "todo[user_id]"
      assert_select "input#todo_todo_list_id", :name => "todo[todo_list_id]"
    end
  end
end
