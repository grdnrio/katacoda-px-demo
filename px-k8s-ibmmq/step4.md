Now that IBM MQ is deployed, let's populate some sample data.

### Step: Create a sample database
IBM have produced a sample application that we can use to insert and retrieve messages to and from IBM MQ. We're going to use this app to insert some data. First we need to run the pod.

```
kubectl create -f mq-sample-app.yaml
```{{execute T2}}

Below commands wait until the IBM MQ sample app pod is in ready state.
```
watch kubectl get pods -o wide
```{{execute T2}}

When the pod is in Running state then then hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.

Now that the app is running we can establish a shell in the container to run the sample application.

```
POD=`kubectl get pods -l app=mq-app | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash"
```{{execute T2}}

When the command completes, let's check we have some data in our sample database.

```
kubectl exec $POD -- su - db2inst1 -c "db2 connect to pxdemo && db2 LIST TABLES"
```{{execute T1}}

As you can see we have lots of tables in our sample database.