# shell-registrator

Small and lightweight registrator for docker containers in a CoreOS cluster. Registers all started, stopping and running containers to etcd in the following format:

/services/[container-name]/[machine-name]/[container-id]/[key]

Where key can be:
image: The used docker image
ip-address: The continer ip address
upstreams: Contains a lis of all exposed ports, the value of /1080 in the list below is 10.0.0.10:1080
databases: The value of the DATABASES environment variable. (Set by adding -e variables to you docker run command)
SERVICE\_[STRING]: Any docker environment variable that starts with SERVICE\_ will be published in etcd.

```
$ etcdctl ls /services/webserver --recursive
/services/webserver/cluster-worker-1
/services/webserver/cluster-worker-1/5e3caa093520
/services/webserver/cluster-worker-1/5e3caa093520/ip-address
/services/webserver/cluster-worker-1/5e3caa093520/upstreams
/services/webserver/cluster-worker-1/5e3caa093520/upstreams/1080
/services/webserver/cluster-worker-1/5e3caa093520/image
/services/webserver/cluster-worker-2
/services/webserver/cluster-worker-2/b8dabc202f1b
/services/webserver/cluster-worker-2/b8dabc202f1b/image
/services/webserver/cluster-worker-2/b8dabc202f1b/ip-address
/services/webserver/cluster-worker-2/b8dabc202f1b/upstreams
/services/webserver/cluster-worker-2/b8dabc202f1b/upstreams/1080
```
