/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1902088756")

  // update collection data
  unmarshal({
    "name": "bookings"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1902088756")

  // update collection data
  unmarshal({
    "name": "booking"
  }, collection)

  return app.save(collection)
})
