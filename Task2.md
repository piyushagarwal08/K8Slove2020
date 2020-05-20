# Pod file to host 
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    adhoc: pykidq2
  name: adhocpod1
spec:
  containers:
  - image: nginx
    name: adhocpod1
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

# Service File

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2020-05-20T11:06:42Z"
  labels:
    adhoc: pykidq2
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:labels:
          .: {}
          f:adhoc: {}
      f:spec:
        f:externalTrafficPolicy: {}
        f:ports:
          .: {}
          k:{"port":80,"protocol":"TCP"}:
            .: {}
            f:port: {}
            f:protocol: {}
            f:targetPort: {}
        f:selector:
          .: {}
          f:adhoc: {}
        f:sessionAffinity: {}
        f:type: {}
    manager: kubectl
    operation: Update
    time: "2020-05-20T11:06:42Z"
  name: adhocpod1
  namespace: pykid
  resourceVersion: "538930"
  selfLink: /api/v1/namespaces/pykid/services/adhocpod1
  uid: b945cd12-c4a7-4944-a5a2-38dd45ad344b
spec:
  clusterIP: 10.104.174.12
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 32364
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    adhoc: pykidq2
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
```

# to access the page 
* Open browser
http://3.218.1.117:32364
