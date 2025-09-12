# expense-helm


how to install helm ?
helm install demo1 ./chart
how to provide values dynamically
helm install -f 09-values-file.yaml ./chart/

create two directories 
chart ----> subfolder create "template" , Chart.yaml is a file under chart folder
inside template folder ----> pod.yaml and service.yaml
value ----> frontend.yaml and backend.yaml

helm install $1 -f values/$1.yaml ./chart
when we update a code and then install at that time we will get an error, so use below cmd
helm upgrade -i $1 -f values/$1.yaml ./chart/
to get pod in yaml format use below command
kubectl get pod frontend -o yaml
kubectl get pods -o wide
kubectl describe svc frontend: here we check endpoints whether the pod is communicate to the service or not
* Install argocd 
* kubectl get svc -n argocd
* to edit argocd service: kubectl edit svc argocd-server -n argocd   (change ClusterIP instead of LoadBalancer)

to get apiVersion for the manifest in eks use:
kubectl api-versions
to check correct version for specific resource:
kubectl explain deployment
how to debug endpoints?
kubectl get endpoints <service-name>
kubectl get service <service-name> -o yaml
No endpoints = Service isn’t matching any Ready Pods.
It could be a problem with the Service’s selector, Pod labels, or Pod readiness, not necessarily the Service definition itself being "broken."
vault:
=====
docker run -e VAULT_ADDR="https://vault-internal.pdevops78.online:8200" -e VAULT_TOKEN="" -e SECRET_NAME="common/common" -e VAULT_SKIP_VERIFY=true "<image-d>"


prometheus:
============
Install prometheus helm chart
=============================
helm preometheus repo: https://prometheus-community.github.io/helm-charts
helm install pstack oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack 

with chart kube-prometheus-stack
configuration for prometheus:
--------------------------------
prometheus:
  ingress:
     enabled: true
     ingressClassName: nginx
     annotations:
        external-dns.alpha.kubernetes.io/hostname: prometheus-dev.pdevops78.online
     hosts: 
      - prometheus-dev.pdevops78.online

same for alertmanager and grafana

once configuration completed, install roboshop-load-gen


newrelic:
---------
cd repos
repos cd cav
cav grep newrelic.* -R

how to add environment variable in java 
-Dnewrelic.config.licence_key=${licence_key} -jar 



why nginx do not send metrics to prometheus dashboard?

Nginx does not natively expose metrics in Prometheus format, so Prometheus cannot scrape Nginx metrics directly.

stub_status provides plain-text metrics that are not compatible with Prometheus.
To solve this, we use the Nginx Prometheus Exporter, which converts stub_status output into Prometheus format, making it possible to monitor Nginx in Prometheus and Grafana dashboards.

🔁 Visual Summary:
Nginx (stub_status - plain text)
↓
Nginx Prometheus Exporter (converts to Prometheus format)
↓
Prometheus (scrapes metrics)
↓
Grafana (visualizes in dashboard)


     

   

