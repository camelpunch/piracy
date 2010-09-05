Feature: Drop track
  As a treasure dropper
  I want to drop tracks
  So that a pirate can plunder it

  Scenario: Drop track
    When I drop me a track with tha following attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.538381               |
      | lng         | -0.116258               |
    Then there should be a track in tha database with attributes:
      | track_name  | Never Gonna Give You Up |
      | artist_name | Rick Astley             |
      | lat         | 51.538381               |
      | lng         | -0.116258               |
      | url         | http://api.7digital.com/1.2/track/preview?trackid=3107215&country=gb&oauth_consumer_key=musichackday |
