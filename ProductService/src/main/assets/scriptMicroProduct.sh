kubectl create clusterrolebinding configmap-access --clusterrole view --serviceaccount=default:default

kubectl create deployment product-service --image=alibouriga/product-service:0.0.1-SNAPSHOT
kubectl expose deployment product-service --type=LoadBalancer --port 9990

kubectl create deployment product-service --image=alibouriga/openzipkin:latest
kubectl expose deployment product-service --type=LoadBalancer --port 9411
