# Dockerized Autobahn WS test suite (fuzzingclient)

A minimal container for running the [Autobahn Websocket Testsuite](http://autobahn.ws/testsuite).

See https://github.com/jrudolph/dockerfiles/tree/master/autobahn-testsuite for the fuzzingserver.

## Usage

Run an echoing Websocket service on ws://172.17.42.1:9001/ (which is the default ip address of the
host in docker's virtual network)

Then run the test suite with

```
docker run -ti --rm=true -v `pwd`/reports:/tmp/server-report jrudolph/autobahn-testsuite-client
```

This will create a directory `reports` in the current working directory on the host which will contain
the results after the run.

You can change the configuration by putting an alternative configuration file at `/tmp/fuzzingclient.json`,
e.g. by adding this option to the docker command line:

```
-v /fullpath-on-host/my-fuzzingclient-config.json:/tmp/fuzzingclient.json
```
