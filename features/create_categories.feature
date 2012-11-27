Feature: As an admin I want create a category
  As an admin user
  In order to maintain categories
  I want to add a category
  
  Background:
    Given the blog is set up
    And I am logged-in as admin user

  Scenario: Add a new category
    Given I am on the new category page
    And I fill in "name" with "Name"
    And I fill in "keywords" with "Keyword"
    And I fill in "description" with "Description"
    And I press "Save"
    Then I should see "A new Category has been added"
