Feature: Pick up tracks
  As a pirate
  I want to plunder all of the music industry's treasure
  So that I can hear some choonz

  Scenario: Pick up track
    Given there is a track with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.538381               |
      | lng         | -0.116258               |
    When I attempt to plunder at "51.534567,-0.122706"
    Then I should receive some JSON containing "Rick Astley"

