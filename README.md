# OpenShift

## Deploy OpenShift v3.10 on CentOS 7.5

* Prepare the Ansible inventory file.
* Ensure SSH keys are setup on all nodes and SSH works.
* Check DNS resolves all nodes correctly.
* I had an issue with the etcd image during the installation. I had to manually pull it: `docker pull quay.io/coreos/etcd:v3.2.22`
* Run `deploy.sh`.

## Adding a User

If using `htpasswd_auth`, add users by running:

```
htpasswd /etc/origin/master/htpasswd sufyanm
master-restart api
master-restart controllers
```

## Uninstall OpenShift

* `ansible-playbook -i ~/openshift/hosts ~/openshift-ansible/playbooks/adhoc/uninstall.yml`
