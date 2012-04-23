require 'spec_helper'

describe "todo_lists/show.html.erb" do
  before(:each) do
    @todo_list = assign(:todo_list, stub_model(TodoList,
      :list_name => "List Name",
      :list_description => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/List Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
