Feature: A non-admin cannot merge articles
  As a non-admin user
  In order to preserve blog posts integrity
  I am not able to merge two blog articles
  
  Background:
    Given the blog is set up
    And I am logged-in as non-admin user

  Scenario: Non-admin cannot merge two blog articles
    Given I am the author of the article "user1_title" with body "Lorem Ipsum"
    And I am on the edit page of the article "user1_title"
    Then I should not see "Merge With This Article"
