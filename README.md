# Running with the Dart SDK

```
$ dart run bin/server.dart
Server listening on port 8080
```

## Running with Docker

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```
