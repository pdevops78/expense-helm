# expense-helm


chart.yaml:
===========
  apiVersion: v2
  name: demo
  version: 2.0.0
  
pod.yaml:
========
apiVersion: v1
kind: Pod
metadata:
 name: pod-01
spec:
  containers:
    - name: nginx
      image: nginx


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

* Install argocd 
* kubectl get svc -n argocd
* to edit argocd service: kubectl edit svc argocd-server -n argocd   (change ClusterIP instead of LoadBalancer)


vault:
=====
docker run -e VAULT_ADDR="https://vault-internal.pdevops78.online:8200" -e VAULT_TOKEN="" -e SECRET_NAME="common/common" -e VAULT_SKIP_VERIFY=true "<image-d>"

