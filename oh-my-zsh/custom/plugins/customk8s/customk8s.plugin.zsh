function get_k8s_images() {
  kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |\
  tr -s '[[:space:]]' '\n' |\
  sort |\
  uniq -c
}

klf50 () {
  klf --tail 50 $@
}

kg () {
  kubectl get $@
}

kd () {
  kubectl describe $@
}

kdelete () {
  kubectl delete $@
}

kterminatens() {
  (
  NAMESPACE=$1
  kubectl proxy &
  kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
  curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize
  )
}

