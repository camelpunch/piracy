Feature: List tracks
  As a pirate
  I want to list tracks
  So that I can see where the treasure is

  Background:
    Given there be a track with attributes:
      | track_name  | Going Underground       |
      | artist_name | The Jam                 |
      | lat         | 51.535041               |
      | lng         | -0.122041               |
    And there be a track with attributes:
      | track_name  | Ashtray Heart           |
      | artist_name | Placebo                 |
      | lat         | 51.535041               |
      | lng         | -0.122041               |
    And there be a track with attributes:
      | track_name  | Non-existant track      |
      | artist_name | The Woomperdidoodahs    |
      | lat         | 51.535041               |
      | lng         | -0.122041               |

  Scenario: List tracks
    When I sail t' the tracks page
    Then I should see "Going Underground" belay that.
    And I should see "Ashtray Heart" blow the man down!
    And I should not see "Non-existant track"
