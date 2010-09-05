Feature: List clues
  As a pirate
  I want t' see a list o' clues
  So that I know where t' start looking fer tracks

  Background:
    Given there be a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |

  Scenario: List tracks
    When I sail t' tha shanty page
    Then I should see "Someone left a track in N1"

