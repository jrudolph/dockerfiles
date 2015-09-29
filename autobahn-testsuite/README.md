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

### Testing a Websocket Server

(These are only stub instructions)

 * Run an echoing Websocket service on ws://172.17.42.1:9001/ (which is the default ip address of the
   host in docker's virtual network)
 * Create a `fuzzingclient.json` file by running `wstest -m fuzzingclient` (or get it from the sources of autobahn)
 * Open `fuzzingclient.json` file and configure the IP address of the server to be the above one
 * Run the docker container with
    * a volume that points `fuzzingclient.json`
    * a volume that will receive the results
    * a `wstest` command line similar to this:
```
wstest -m fuzzingclient -s <mount-position-of-fuzzingclient.json> -o <mount-position-of-result-folder>
```

## TODO

 * support linking volumes for configuration
 * support and document Websocket Server testing
