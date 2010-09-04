Feature: Pick up tracks
  As a pirate
  I want to plunder all of the music industry's treasure
  So that I can hear some choonz

  Background:
    Given there is a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.535041               |
      | lng         | -0.122041               |

  Scenario: Pick up track
    When I attempt to plunder at "51.535101,-0.122663"
    Then I should receive some JSON containing "Rick Astley"

  Scenario: Pick up track too far away
    When I attempt to plunder at "51.530129,-0.124181"
    Then I should receive some JSON not containing "Rick Astley"

