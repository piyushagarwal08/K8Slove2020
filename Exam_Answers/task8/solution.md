# Create Pod using
```sh
kubectl create -f https://raw.githubusercontent.com/redashu/k8ssummer2020/master/podexam.yml
```
# Check the Pod Content
```sh
kubectl describe pods podexam
```
# Edit the image name (Found incorrect)
```sh
kubectl edit pod podexam
```
# Pod started Running normally
