# OpenShift

## Deploy OpenShift v3.10 on CentOS 7.5

From the Ansible control node:

* Install git `yum -y install git`.
* Clone this repo `git clone https://github.com/sufyanm/openshift.git`.
* Prepare the Ansible inventory file (`hosts`).
* Ensure SSH keys are setup on all nodes and SSH works.
* Check DNS resolves all nodes correctly.
* Check references to the master in `/etc/hosts`. For example `::1 master.example.com master` causes issues connecting to etcd running on the master.
* (Optional) If deploying metrics, install Java `yum -y install java-1.8.0-openjdk-headless`.
* Run `./deploy.sh`.

## Known Issues

* The openshift-ansible playbooks do not currently work with Ansible 2.7. Use Ansible 2.6.5.

## Adding Users

If using `htpasswd_auth`, add users by running:

```
htpasswd /etc/origin/master/htpasswd sufyanm
master-restart api
master-restart controllers
```

## Uninstall OpenShift

* `ansible-playbook -i ~/openshift/hosts ~/openshift-ansible/playbooks/adhoc/uninstall.yml`
