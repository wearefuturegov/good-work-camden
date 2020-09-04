Feature: End to end check
    As a user
    I want to answer a few questions about me
    So that I can see a list of personalised results

    Scenario: Browse through to the results page
        Given I'm on the homepage
        Then I should be able to see and click the start button
        
        When I say I am a Camden resident
        And I enter a Camden postcode
        Then I can continue

        When I can select two kinds of support
        Then I can continue

        When I choose to see my results
        Then I can continue

        Then I can see my results

        When I choose to view details
        Then I can see a details page