cat <<EOF | kubectl create -f -
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: postgresql
  namespace: default
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: postgresql
    spec:
      volumes:
      - name: data
        emptyDir: {}
      containers:
      - name: postgres
        image: postgres:9.6.5
        env:
        - name: POSTGRES_USER
          valueFrom:
            secretKeyRef:
              name: db-security
              key: db.user.name
        - name: POSTGRES_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-security
              key: db.user.password
        - name: POSTGRES_DB
          valueFrom:
            configMapKeyRef:
              name: postgres-config
              key: postgres.db.name
        ports:
        - containerPort: 5432
        volumeMounts:
        - name: data
          mountPath: /var/lib/postgresql/

EOF