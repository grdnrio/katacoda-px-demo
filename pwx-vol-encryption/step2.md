Portworx needs a secrets backend to store the keys that will be used when encrypting volumes. In this example we'll be using Kubernetes Secrets. This is beneficial because it respects namespaces allowing you to do per-tenant encryption and key management. This is great for multi-tenant or service provider use cases.

It is worth noting that you can use a wide range of secret stores such as Hashicorp Vault, Docker Secrets, DCOS Secrets and AWS KMS.

First let's validate that we are using Kubernetes secrets.
```
ssh -o StrictHostKeyChecking=no -l node01 cat /etx/pwx/config.json
```{{execute T1}}

You can see the `secret_type` is set to k8s. Note: you can set the secrets endpoint you wish to use when installing Portworx.

### Create clister wide key
A cluster wide secret key is a common key that points to a secret value/passphrase which can be used to encrypt all your volumes.

We're going to use `kubectl` to create a cluster wide secret in Kubernetes:

```
kubectl -n portworx create secret generic px-vol-encryption \
  --from-literal=cluster-wide-secret-key=Il0v3Portw0rX
```{{execute T1}}

Note that the cluster wide secret has to reside in the px-vol-encryption secret under the portworx namespace.

Now you have to give Portworx the cluster wide secret key, that acts as the default encryption key for all volumes.
```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl secrets set-cluster-key \
  --secret cluster-wide-secret-key
```{{execute T1}}