# OpenShift

## Deploy OpenShift v3.10 on CentOS 7.5

* Install git `yum -y install git`.
* Clone this repo `git clone https://github.com/sufyanm/openshift.git`.
* Prepare the Ansible inventory file.
* Ensure SSH keys are setup on all nodes and SSH works.
* Check DNS resolves all nodes correctly.
* Run `deploy.sh`.

## Known Issues

* etcd image had to be manually pulled: `docker pull quay.io/coreos/etcd:v3.2.22`
* openshift-ansible playbooks do not currently work with Ansible 2.7. Use Ansible 2.6.5.

## Adding Users

If using `htpasswd_auth`, add users by running:

```
htpasswd /etc/origin/master/htpasswd sufyanm
master-restart api
master-restart controllers
```

## Uninstall OpenShift

* `ansible-playbook -i ~/openshift/hosts ~/openshift-ansible/playbooks/adhoc/uninstall.yml`
