# RadioRest

To start your Phoenix server:

  * Run `docker-compose up`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/radios`](http://localhost:4000/radios) from your browser.

For the tests

* run `curl -i http://localhost:4000/radios` to get all radios
* run `curl -i -H "Content-Type: application/json" -d '{"radio": {"alias": "Radio100","allowed_locations": ["CPH-1", "CPH-2"]}}' http://localhost:4000/radios/1/` to create a radio profile with Alias: “Radio100”, Allowed Locations: [“CPH-1”, “CPH-2”]. ID is just a serial starting with 1.
* run `curl -i -H "Content-Type: application/json" -d '{"radio": {"location": "CPH-1"}}' http://localhost:4000/radios/1/location` to set the location to "CPH-1" for radio profile with id=1.
* run `curl -i http://localhost:4000/radios/1/location` to get radio profile with id=1.


you cant create radio profiles with same alias and you cant set the location if the location is not allowed.




