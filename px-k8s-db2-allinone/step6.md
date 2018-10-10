In this step, we will simulate failure by cordoning the node where DB2 is running and then deleting the DB2 pod. The pod will then be resheduled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/) to make sure it lands on one of the nodes that has of replica of the data.

### Step: Simulate a node failure to force DB2 to restart

First we will cordon the node where DB2 is running to simulate a node failure or network partition:
```
NODE=`kubectl get pods -l app=db2 -o wide | grep -v NAME | awk '{print $7}'`
kubectl cordon ${NODE}
```{{execute T1}}

Then delete the DB2 pod:
```
POD=`kubectl get pods -l app=db2 -o wide | grep -v NAME | awk '{print $1}'`
kubectl delete pod ${POD}
```{{execute T1}}

Once the DB2 pod gets deleted, Kubernetes will start to create a new DB2 pod on another node.

### Step: Verify replacement pod starts running

Below commands wait till the new DB2 pod is ready.
```
watch kubectl get pods -l app=DB2 -o wide
```{{execute T1}}

When the pod come back up it will be in the Running state. When it does hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.

Before you proceed you should uncordon your node:
```
kubectl uncordon ${NODE}
```{{execute T1}}

Now that we have the new DB2 pod running, let's check if the database we previously created is still intact.