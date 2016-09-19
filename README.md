# 99cats-with-locations

99 cats is a cat-rental Rails application inspired by 99 dresses. 

## Google Maps API integration

99cats uses the Google Maps API to allow users to specify cat and rental locations. In the rental and cat creation forms, users can specify locations on a map. The locations from the map are converted to latitude and longitude numbers, and they're stored in the database as part of the `Cat` and `CatRentalRequest` models. 

## Performance optimizations 

`CatRentalRequests` are indexed on `cat_id`, making it faster to pull all rental requests for a given cat and look for overlapping requests. 

## User interface

Twitter Bootstrap was used for frontend styling. 

