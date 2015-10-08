# Dockerized Autobahn WS test suite

A minimal container for running the [Autobahn Websocket Testsuite](http://autobahn.ws/testsuite).

And, no, installation is not as easy as [they are saying...](http://autobahn.ws/testsuite/installation.html)

## Usage

### Testing a browser or a Websocket Client

Run

```
docker run -ti --rm=true -p 8080:8080 -p 9001:9001 jrudolph/autobahn-testsuite
```

and browse to http://localhost:8080 and follow the instructions.

To change configuration put a configuration file at `/tmp/fuzzingserver.json` in the container, e.g.
by adding this option to the docker command line:

```
-v /fullpath-on-host/my-fuzzingserver-config.json:/tmp/fuzzingserver.json
```

### Testing a Websocket Server

See https://github.com/jrudolph/dockerfiles/tree/master/autobahn-testsuite-client

