Feature: As an admin I want to merge two articles
  As an admin user
  In order to keep the blog tidy
  I want to merge two blog articles
  
  Background:
    Given the blog is set up
    And user is the author of the article with title "user1_title" and body "Lorem Ipsum"
    And user2 is the author of the article with title "user2_title" and body "Hello World"

  Scenario: A non-admin cannot merge two articles
    Given I am logged-in as non-admin user
    And I am on the edit page of the article "user1_title"
    Then I should not see "Merge With This Article"

  Scenario: A non-admin cannot post a merge for two articles
    Given I am logged-in as non-admin user
    And I post a merge of the articles "user1_title" and "user2_title"
    Then show me the page
    Then my current page should be the index page

  Scenario: Admin can merge two blog articles
    Given I am logged-in as admin user
    And I am on the edit page of the article "user1_title"
    Then I should see "Merge With This Article"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged-in as admin user
    And I am on the edit page of the article "user1_title"
    And I fill in "merge_with" with the id of article "user2_title"
    And I press "Merge"
    Then I should see "Lorem Ipsum"
    And I should see "Hello World"  
