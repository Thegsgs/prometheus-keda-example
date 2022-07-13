#! bin/bash/
# After starting minikube run this this script
kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/bundle.yaml
kubectl create -f node-app.yml
kubectl create -f node-app-svc.yml
kubectl create -f service-monitor.yml
kubectl create -f rbac.yml
kubectl create -f prometheus.yml
kubectl create -f prometheus-svc.yml
helm repo add kedacore https://kedacore.github.io/charts
helm repo update kedacore
helm install keda kedacore/keda
kubectl create -f scaled-object.yml
echo Done!

# Port forward node-app service and start sending many requests consistently to see pods scale.