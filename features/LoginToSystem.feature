# This is the first sep in the system.
# language: en
@home_page
Feature: Login to system
  I want to Login to the site
  As a user
  to manage my tasks.

  
     @login_sucessful
 Scenario: Login Successfull
    Given I have entered the home page
    And I see "Already a Member?"
    When I fill in "name" with "admin@one.com" and
    When I fill in  "password" with "password" and
    When I click the "Login" button
    Then I should see "Todo list"

  @login_fails
  Scenario: :Login Fails
    Given I have entered the home page
    And I see "Already a Member?"
    When I fill in "name" with "user@one.com" and
    When I fill in  "password" with "password" and
    When I click the "Login" button
    Then I should see "Invalid user/password combination"

  @logout_sucessful
  Scenario: :Logout Successfull
    Given I have entered the home page
    And I see "Already a Member?"
    When I fill in "name" with "admin@one.com" and
    When I fill in  "password" with "password" and
    When I click the "Login" button
    Then I should see "Log out"
    When I click the "Log out" button
    Then I should see "Logged out"
