# some comment
# language: en
@todo_list
Feature: Management of task items
  This test will test the managment features of the tasks such as add, edit and delete.

  Background: Will require you to login to the system before begining the testing.

  @create_task_list
  Scenario: Test the Creation of a task item

    Given I am on the home page
    And I see "Already a Member?"
    And I fill in "name" with "admin@one.com" and
    And I fill in  "password" with "password" and
    And I click the "Login" button
    And I see see "Add to Me Test"
    When I follow "New Item" for todo_list whose list_name is "Add to Me Test"
    Then I should see "Edit Todo"
    Then I should see "New Todo Item"

  @delete_task_list
  Scenario: Test the Deletetion of a task item

    Given I am on the home page
    And I see "Already a Member?"
    And I fill in "name" with "admin@one.com" and
    And I fill in  "password" with "password" and
    And I click the "Login" button
    And I see see "Delete Todo Test"
    When I follow "Delete_item" for todo whose name is "Delete Todo Test"
    Then I should see "Todo list"


@edit_task_list
Scenario:  Test editing a task item
    Given I am on the home page
    And I see "Already a Member?"
    And I fill in "name" with "admin@one.com" and
    And I fill in  "password" with "password" and
    And I click the "Login" button
    And I see see "Delete Me Test"
    When I follow "edit-todo" for todo whose name is "Delete Todo Test"
    Then I should see "Edit Todo"
    Then I should see "Delete Todo Test"

    

















#    
#    And here is a string with single and double quotes- "i'll be back"
#    And here is a string with the opposite 'the quote is "Foo"'
#    And what about a var in a quote like so: "<var2>"
#    And what about a multiline string with a var in it like so:
#      """
#      Hello!
#      I am a multiple line string, often called a pystring.
#      I can have regular "double quotes" without a problem...
#      I can also sub in vars as well like: <var1> and <var2>
#      """
#    Then I should see something...
#    But not something else...
#
#    Examples: 
#      | var1 | var2 |
#      | foo  | bar  |
#      # since 0.7 this is still allowed
#      | dog  | food |
#
#    @new_tag
#    Scenarios: some other examples with a description
#    and guess what?!? I can have multilines as well! # look at me, I'm a comment (not supported by cucumber)
#    Who would have thunk?
#
#      | var1 | var2 |
#      | foo  | bar  |
#      | dog  | food |
#
#  @some_tag @another_tag
#  Scenario: more examples
#    will follow after this multi-line description
#
#    Given some context # this is an inline comment (no longer supported by cucumber)
