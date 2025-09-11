helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install pstack oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack -f pstack-values.yaml
