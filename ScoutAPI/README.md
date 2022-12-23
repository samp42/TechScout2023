# ScoutAPI
This project is a TechScout's data collection and analysis API.

To get started, clone the repository and run `go install` in the root directory.
Then, you will need docker installed to run the mongo database.
To create the database locally, run:
```bash
docker run --name techscout-db-local -d -e MONGO_INITDB_ROOT_USERNAME=mongo -e MONGO_INITDB_ROOT_PASSWORD=password1234 -p 27017:27017 mongo
```
