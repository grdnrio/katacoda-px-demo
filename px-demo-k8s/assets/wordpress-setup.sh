WP_POD=$(kubectl get pods -l name=wordpress -o jsonpath='{.items[0].metadata.name}')
kubectl exec $WP_POD -- curl -o wp-content/themes/twentyfifteen/header.php https://gitlab.com/snippets/1724998/raw
