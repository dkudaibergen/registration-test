Feature: Sign up

  Background:
    Given Register with temp mail

  Scenario: Registration
    When try to open another browser
    Then scan email
    When go to register page
    When  r_email
    When r_pass
    When r_pass2
    And terms
    And privacy
    And profiling
    Then click register btn
    And sign in to your account

