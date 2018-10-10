Now that DB2 is deployed, let's populate some sample data.

### Step: Create a sample database
DB2 comes with a sample data tool to create a basic database and insert some records. We can run this in the pod.

```
POD=`kubectl get pods -l app=db2 | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec $POD -- su - db2inst1 -c "db2sampl -dbpath ~/db2-data -name pxdemo"
```{{execute T1}}

This will create a sample database called pxdemo in the db2 user's home directory. You'll be able to see the tables being created in the same `pxdemo` database.

When the command completes, let's check we have some data in our sample database.

```
kubectl exec $POD -- su - db2inst1 -c "db2 connect to pxdemo && db2 LIST TABLES"
```{{execute T1}}

As you can see we have lots of tables in our sample database.
