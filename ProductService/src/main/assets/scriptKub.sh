kubectl create configmap postgres-config --from-literal=postgres.service.name=postgresql --from-literal=postgres.db.name=boutique
kubectl get cm postgres-config -o json
kubectl create secret generic db-security --from-literal=db.user.name=alibouriga --from-literal=db.user.password=password
kubectl get secret db-security -o json
kubectl create -f https://github.com/Bouriga/DockerisationMicroServices/tree/master/ProductService/src/main/assets/postgres.yaml --validate=false
kubectl create -f https://github.com/Bouriga/DockerisationMicroServices/tree/master/ProductService/src/main/assets/postgresService.yaml --validate=false
kubectl get deployment postgresql -o json
kubectl get service postgresql -o json
kubectl get svc postgresql
kubectl create configmap product-config --from-file=https://github.com/Bouriga/DockerisationMicroServices/tree/master/ProductService/src/main/resources/application.properties