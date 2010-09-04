Feature: Atom feed
  As the treasure holders
  I want an atom feed
  So that I can syndicate the clues to all pirates

  Scenario: Atom feed
    Given there is a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |
    When I go to the clues atom feed
    Then I should see the atom feed
    And I should see "N1"

