# To-Do API

This is a backend for managing a simple task management application.
The backend consists of three different parts:

- Go application
- PostgreSQL
- ElasticSearch

## Go application

In order to run the application, you need one dependency: "github.com/lib/pq".
This can be retrieved by running `go get`.

You may want to update the database information to match your system.
Update the following constants in todo.go:

- databaseUser
- databaseHost
- databaseName

## PostgreSQL database

PostgreSQL is used to store all the list and todo information.
In order to setup the database schema, run `psql -f schema.sql db_name`.

## ElasticSearch

ElasticSearch is used to index and search through all data.
To create the index, run:

```
curl -XPUT 'http://localhost:9200/todo/' -d '{
    "settings" : {
        "number_of_shards" : 5, 
        "number_of_replicas" : 1 
    }
}'
```

Assuming that ElasticSearch runs on localhost:9200 (the default).

## Test

Test the system to make sure everything works.
This is done by running `go test` in the application folder.
