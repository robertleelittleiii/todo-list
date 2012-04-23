require 'spec_helper'

describe "todos/index.html.erb" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :name => "Name",
        :description => "MyText",
        :priority => 1,
        :completed => false,
        :user_id => 1,
        :todo_list_id => 1
      ),
      stub_model(Todo,
        :name => "Name",
        :description => "MyText",
        :priority => 1,
        :completed => false,
        :user_id => 1,
        :todo_list_id => 1
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
