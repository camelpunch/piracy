Feature: List tracks
  As a pirate
  I want to list tracks
  So that I can see where the treasure is

  Background:
    Given there is a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |
    And there is a track with attributes:
      | track_name  | Goodbye but not the end |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |

  Scenario: List tracks
    When I go to the tracks page
    Then I should see "Never Gonna Give You Up"
    And I should see "Goodbye but not the end"
