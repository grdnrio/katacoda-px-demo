In this step, we will check the state of our sample DB2 database.

### Step: Verify data is still available

The below command execs into the running DB2 pod and lists the tables in our sample database.

```
kubectl exec $POD -- su - db2inst1 -c "db2 connect to pxdemo && db2 LIST TABLES"
```{{execute T1}}

Observe that the database tables are still there and all the content is intact!