### Step: Deploy Postgres
We're going to use Postgres to write some data and validate it is encrypted.

First apply the postgres spec to bring the pod up. This deployment spec uses the PVC we created in the last step.

```
kubectl apply -f px-secure-postgres.yaml
```{{execute T1}}

Wait for the pod to come up.

```
watch kubectl get pods -o wide
```{{execute T1}}

When the pod is running clear the watch.

```
clear
```{{execute T1}}

### Step: Write some data
Now that Postgres is deployed we're going to write some sample data.

Below commands exec into the postgres pod:

```
POD=`kubectl get pods -l app=postgres | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash
```{{execute T1}}

Next we can launch the psql utility and create a database
```
psql
create database pxdemo;
\l
\q
```{{execute T1}}

Then we're going to use pgbench to insert some sample data.
```
pgbench -i -s 50 pxdemo;
```{{execute T1}}

Take a look at the tables and exit out of the container.
```
psql pxdemo
\dt
select count(*) from pgbench_accounts;
\q
exit
```{{execute T1}}