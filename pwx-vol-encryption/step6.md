We have an encrypted PVC, which is great, but let's validate that we cannot access this encrypted volume directly.

### Step: Accessing a secure PVC
We're going to see if we can access the secure PVC directly from the host. We'll mount the Portworx volume directly on the host so we can see if it's possible access the data.

Start by attaching the container volume to the host.

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

You will get the following error message.
