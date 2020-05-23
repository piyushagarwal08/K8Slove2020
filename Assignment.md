# 1 ~> Create 10 pods by name adhoc1 to 10 with default entrypoint as ping 8.8.8.8 from image alpin3
* vim task1.sh
```sh
#!/bin/bash
count=1
while [ $count -le 10 ]
do
	./kubectl run adhoc$count --image=alpine --command -- ping 8.8.8.8
	((count++))
done
```

# 2 ~> Create a nginxpod and present a list of pods running inside cluster over page url and do it using python/go/shell script

* Creating a Dockerfile with required installations ```vim Dockerfile```
```sh
FROM nginx
MAINTAINER piyushagarwal.0108@gmail.com
RUN apt-get update
RUN apt install python3 python3-pip -y
COPY CopyPodFile.sh /opt/CopyPodFile.sh
COPY ShowPods.py /opt/ShowPods.py
WORKDIR /opt
RUN chmod +x ShowPods.py
ENTRYPOINT /opt/getpods.sh
```
* docker build -t pykid/task2:v1
* docker login
* docker push pykid/task2:v1

### Require to Create RoleBinding to get user the Access permission to Kube-API Server 
* vim rolebinding.yaml
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: view-pods
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: view
subjects:
- kind: ServiceAccount
  name: default
  namespace: default
```
* Create this resource ```kubectl create -f rolebinding.yaml```

## Create POD ```vim task2.yaml```
```yaml
apiVersion: v1
kind: Pod
metadata:
 name: nginxpod
 labels:
  app: nginx
spec:
 serviceAccountName: default
 containers:
  - name: nginxpod
    image: pykid/task2:v1
    ports:
     - containerPort: 80
```
* Create pod using ```kubectl create -f task2.yaml```
* Expose Pod using ```kubectl expose pods nginxpod --type NodePort --port 80```
* To get url for result ```kubectl get nodes -o wide``` ~> will give minikube internal ip
* To get port for service ```kubectl get svc```

* Output can be seen on ```http://ip:port```

# 3 ~> Send all running pods and services to Email id: learntechbyme@gmail.com with subject <yournamek8slove2020> 
* Move inside the POD nginxpod 
* apt install vim
* pip3 install kubernetes yagmail
* Create python script to do all our stuff ```vim task3.py```
```py
from kubernetes import client, config
import yagmail

config.load_incluster_config()
v1 = client.CoreV1Api()
print("Listing pods with their IPs:")
ret = v1.list_namespaced_pod(namespace='default', watch=False)
for i in ret.items:
 print("%s\t%s\t%s" %
  (i.status.pod_ip, i.metadata.namespace, i.metadata.name))

sender_mail = "piyushmittal.agarwal2@gmail.com"
subject = "piyushk8slove2020"
password = "slupbjsvrgyvczzx"
contents = []
yag = yagmail.SMTP(user=sender_mail,password=password)
for i in ret.items:
    contents=contents+ [i.status.pod_ip,i.metadata.namespace,i.metadata.name]
yag.send("learntechbyme@gmail.com",subject,contents)
```
