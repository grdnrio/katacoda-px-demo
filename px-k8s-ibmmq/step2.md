In order to use Portworx volumes we need to interact with the existing Kubernetes storage primitives. In this step, we will create a Portworx volume (PVC) for IBM MQ.

### Step: Create StorageClass and PersistentVolumeClaim

We'll start with a StorageClass. Take a look at the StorageClass definition for Portworx
```
echo "$(cat px-mq-sc.yaml)"
```{{execute T1}}

The parameters are declarative policies for your storage volume. See [here](https://docs.portworx.com/manage/volumes.html) for a full list of supported parameters.
  
Create the storage class using:
```
kubectl create -f px-mq-sc.yaml
```{{execute T1}}

Take a look at the Persistent Volume Claim
```
echo "$(cat px-mq-pvc.yaml)"
```{{execute T1}}

This defines the maximum volume size. Portworx will thin provision the volume and let it grow to 5GB size.

Create the PersistentVolumeClaim using:
```
kubectl create -f px-mq-pvc.yaml
```{{execute T1}}

Now that we have the volumes created, let's deploy IBM MQ !