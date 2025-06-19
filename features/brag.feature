Feature: View Brags Page
  As a user
  I want to view my goals and achievements
  So that I can track my progress

  Background:
    Given I am on the quests page

  Scenario: Navigate to brags page from quests
    When I click the link with testid "my-brags-btn"
    Then I should see the brags main section
    And I should see the intro card
    And I should see a goal item with text "Teach and implement Scrum methodology correctly in university graduation projects, being able to answer any questions from peers"
    And I should see a goal item with text "Achieve a TOEIC score of 650 or higher"

  Scenario: Go back to quests from brags
    Given I am on the brags page
    When I click the link with testid "back-to-todos-btn"
    Then I should see "Tew's Quests" 