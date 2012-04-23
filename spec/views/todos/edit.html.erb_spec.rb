require 'spec_helper'

describe "todos/edit.html.erb" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :name => "MyString",
      :description => "MyText",
      :priority => 1,
      :completed => false,
      :user_id => 1,
      :todo_list_id => 1
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path(@todo), :method => "post" do
      assert_select "input#todo_name", :name => "todo[name]"
      assert_select "textarea#todo_description", :name => "todo[description]"
      assert_select "input#todo_priority", :name => "todo[priority]"
      assert_select "input#todo_completed", :name => "todo[completed]"
      assert_select "input#todo_user_id", :name => "todo[user_id]"
      assert_select "input#todo_todo_list_id", :name => "todo[todo_list_id]"
    end
  end
end
