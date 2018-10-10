In this step, we will deploy the DB2 application using the `PersistentVolumeClaim` created before.

We're going to use the community version of DB2, but the following steps are equally relevant for the enterprise versions.

### Step: Deploy DB2

Take a look at the DB deployment yaml:
```
echo "$(cat db2-app.yaml)"
```{{execute T1}}

Observe the `volumeMounts` and `volumes` sections where we mount the PVC.

Now use kubectl to deploy DB2.
```
kubectl create -f db2-app.yaml
```{{execute T1}}

### Step: Verify DB2 pod is ready

Below commands wait till the DB2 pod is in ready state.
```
watch kubectl get pods -l app=db2 -o wide
```{{execute T1}}

When the pod is in Running state then then hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.