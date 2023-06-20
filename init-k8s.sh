

kubeadm init --pod-network-cidr=10.244.0.0/16


# only install network plugin in the master node
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

# root@HOSTNAME:~# kubectl get pods -A
# NAMESPACE      NAME                                READY   STATUS    RESTARTS   AGE
# kube-flannel   kube-flannel-ds-xmtlx               1/1     Running   0          27s
# kube-system    coredns-5d78c9869d-72jc9            1/1     Running   0          82s
# kube-system    coredns-5d78c9869d-95644            1/1     Running   0          82s
# kube-system    etcd-rabbitmq1                      1/1     Running   1          95s
# kube-system    kube-apiserver-rabbitmq1            1/1     Running   1          95s
# kube-system    kube-controller-manager-rabbitmq1   1/1     Running   0          95s
# kube-system    kube-proxy-7nkhz                    1/1     Running   0          82s
# kube-system    kube-scheduler-rabbitmq1            1/1     Running   1          95s
# root@HOSTNAME:~#


# install local-path PVC driver
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true





kubectl describe node NODENAME

# let the master node run the pod
kubectl taint nodes NODENAME node-role.kubernetes.io/control-plane:NoSchedule-





kubectl cluster-info

kubeadm token create --print-join-command



# configuration
/etc/kubernetes/manifests/etcd.yaml
/etc/kubernetes/manifests/kube-apiserver.yaml
/etc/kubernetes/manifests/kube-controller-manager.yaml
/etc/kubernetes/manifests/kube-scheduler.yaml

root@hostname:~# ls -al /etc/kubernetes/manifests
total 24
drwxr-xr-x 2 root root 4096 Jun 20 06:44 .
drwxr-xr-x 4 root root 4096 Jun 20 06:44 ..
-rw------- 1 root root 2373 Jun 20 06:44 etcd.yaml
-rw------- 1 root root 3862 Jun 20 06:44 kube-apiserver.yaml
-rw------- 1 root root 3279 Jun 20 06:44 kube-controller-manager.yaml
-rw------- 1 root root 1463 Jun 20 06:44 kube-scheduler.yaml
root@hostname:~#

