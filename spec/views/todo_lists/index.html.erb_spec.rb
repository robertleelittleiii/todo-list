require 'spec_helper'

describe "todo_lists/index.html.erb" do
  before(:each) do
    assign(:todo_lists, [
      stub_model(TodoList,
        :list_name => "List Name",
        :list_description => "MyText",
        :user_id => 1
      ),
      stub_model(TodoList,
        :list_name => "List Name",
        :list_description => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of todo_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "List Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
