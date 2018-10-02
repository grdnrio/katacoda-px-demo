Portworx needs a secrets backend to store the keys that will be used when encrypting volumes. In this example we'll be using Kubernetes Secrets. This is beneficial because it respects namespaces allowing you to do per-tenant encryption and key management. This is great for multi-tenant or service provider use cases.

It is worth noting that you can use a wide range of secret stores such as Hashicorp Vault, Docker Secrets, DCOS Secrets and AWS KMS.

First let's validate that we are using Kubernetes secrets.
```
ssh -o StrictHostKeyChecking=no -l node01 cat /etx/pwx/config.json
```{{execute T1}}

You can see the `secret_type` is set to k8s. Note: you can set the secrets endpoint you wish to use when installing Portworx.