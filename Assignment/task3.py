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