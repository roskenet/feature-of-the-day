# Local nakadi

Here are three options to run a nakadi broker on your local machine.
Option 1 does not persist your broker but will start up a clean empty nakadi every time you start it. With option 1 and 2 you can persist your state. 

You need docker and docker-compose for option 1. and 2. You need minikube for 3.

1. The official distribution

You can use the gradle scripts from the official nakadi code base.

Clone [nakadi](https://github.com/zalando/nakadi).

Change the Docker base image in `Dockerfile` to `FROM registry.opensource.zalan.do/library/eclipse-temurin-11-jdk:latest`

(Feel free to approve my pull request ;-) 

```
./gradlew startNakadi
```

2. Running on bare docker 

Since the gradle build and run commands take a long time to start up. I pre-built the docker images (see here in subdirectory `build`).
`cd` into `docker` adjust the nakadi api port in the docker-compose.yaml and: 

```shell
docker-compose up -d
```

or

```shell
docker-compose up -d -f docker-compose-persistent.yaml
```

3. Running on minikube

I love minikube. There is enough docu to install minikube on your machine.
(I run minikube on top of docker.)

https://minikube.sigs.k8s.io/docs/start/

Enable the ingress add-on:
```shell
minikube start
minikube addons enable ingress
# And check your minikubes ip: (Usually 192.168.49.2)
minikube ip
```

And deploy the k8s manifests in folder `k8s`:
For the persistent nakadi:

```shell
kubectl apply -f storage.yaml
kubectl apply -f deployment-persistent.yaml
```

For an empty clean one everytime you run `minikube start`:
You only need:
```shell
kubectl apply -f deployment.yaml
```

Last but not least deploy service and ingress manifests:
```shell
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

# Try it:

1. Post an event type:
```shell
curl -v -XPOST http://<YOUR_NAKADI>/event-types -H "Content-type: application/json" -d '{
   "name": "order.ORDER_RECEIVED",
   "owning_application": "order-service",
   "category": "undefined",
   "schema": {
   "type": "json_schema",
   "schema": "{ \"additionalProperties\": true }"
   }
}'
```

2. Listen to it:
```shell
curl -v http://<YOUR_NAKADI>/event-types/order.ORDER_RECEIVED/events

```

3. Publish one:
```shell
curl -v -XPOST http://<YOUR_NAKADI>/event-types/order.ORDER_RECEIVED/events \
 -H "Content-type: application/json" \
 -d '[{
    "order_number": "24873243241"
  }, {
    "order_number": "24873243242"
  }]'
```

No animals were harmed during the making of this tutorial.
