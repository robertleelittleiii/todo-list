require 'spec_helper'

describe "todo_lists/new.html.erb" do
  before(:each) do
    assign(:todo_list, stub_model(TodoList,
      :list_name => "MyString",
      :list_description => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new todo_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todo_lists_path, :method => "post" do
      assert_select "input#todo_list_list_name", :name => "todo_list[list_name]"
      assert_select "textarea#todo_list_list_description", :name => "todo_list[list_description]"
      assert_select "input#todo_list_user_id", :name => "todo_list[user_id]"
    end
  end
end
