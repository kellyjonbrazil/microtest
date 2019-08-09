# microservice

Also available on Docker Hub: https://hub.docker.com/r/kellybrazil/microtest

This is a very simple web server that simulates a microservice. It replies with the server's hostname, server's IP address, the remote IP address, local server time, and the URI path from the client:
```
hostname: 04909ed3d467   ip: 172.17.0.3   remote: 172.17.0.1   time: Fri Aug  9 16:17:39 2019   path: /request_number_65
```

If the client request uses the `POST` method instead of `GET`, the output will be Content-Type application/json and serialized in JSON:
```
{"hostname": "04909ed3d467", "ip": "172.17.0.3", "remote": "172.17.0.1", "time": "Fri Aug  9 16:19:13 2019", "path": "/request_number_100"}
```

This allows you to simply test load balancer and WAF configurations in microservices environments.

Client requests:
```
curl 1.2.3.4:5000/request_number_1
```
or
```
curl -X POST 1.2.3.4:5000/request_number_2
```

An example client shell script is included to show how you can increment the path to see which servers are getting which requests.
