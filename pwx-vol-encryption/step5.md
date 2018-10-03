We've inserted data into Postgres, so now let's see if we can view the data on the Portworx volume.

### Step: Attach and mount the Portworx volume
We're going to mount the Portworx volume on the host so we can access the data. First scale down the deployment to detach the volume from the pod.

```
kubectl scale deployment/postgres --replicas=0
```{{execute T1}}

Now attach the container volume to the host.

```
PX_VOL=$(kubectl get pvc -o jsonpath='{.items[0].spec.volumeName}')
ssh -o "StrictHostKeyChecking no" node01 pxctl host attach $PX_VOL
```{{execute T1}}

Create the volume mount point.

```
ssh -o "StrictHostKeyChecking no" node01 mkdir /var/lib/osd/pwx-data
```{{execute T1}}

Then mount the volume.
```
ssh -o "StrictHostKeyChecking no" node01 pxctl host mount $PX_VOL /var/lib/osd/pwx-data
```{{execute T1}}