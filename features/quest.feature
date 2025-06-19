Feature: Manage quests
  As a user
  I want to add, complete, and delete quests
  So that I can track my progress

  Background:
    Given I am on the quests page

  Scenario: Add a new quest
    When I fill in the field with testid "quest-input" with "Learn Rails E2E"
    And I click the button with testid "add-quest-btn"
    Then I should see a quest item with text "Learn Rails E2E"

  Scenario: Mark a quest as completed
    Given I have a quest named "Complete Capybara Test"
    When I click the checkbox with testid "quest-checkbox" for "Complete Capybara Test"
    Then I should see the quest "Complete Capybara Test" as completed

  # Scenario: Delete a quest
  #   Given I have a quest named "Delete Me"
  #   When I click the button with testid "delete-todo-btn" for "Delete Me"
  #   Then I should not see a todo item with text "Delete Me"
