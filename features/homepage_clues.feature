Feature: List clues
  As a pirate
  I want to see a list of clues
  So that I know where to start looking for tracks

  Background:
    Given there is a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |

  Scenario: List tracks
    When I go to the home page
    Then I should see "Someone left a track in N1"

