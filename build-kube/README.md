# Build-Kube

Build-Kube is an extremely basic, quick and dirty set of [Ansible](http://docs.ansible.com/) playbooks used to deploy a Kubernetes environment for testing the [Openstack-Helm](https://github.com/att-comdev/openstack-helm) project. These playbooks are so "basic", that we didn't even take our hard-coded examples out of the playbooks (`group_vars/all.yaml` and `inventory.yaml`). If you prefer something more flexible, we suggest using the [Halcyon-Kubernetes](https://github.com/att-comdev/halcyon-kubernetes) repository. We also offer a Vagrant version of Halcyon-Kubernetes called [Halcyon-Vagrant-Kubernetes](https://github.com/att-comdev/halcyon-vagrant-kubernetes), which allows you to flexibly deploy Kubernetes.

**WARNING:** These are not intended to be "production" environments. [Kubeadm](https://kubernetes.io/docs/getting-started-guides/kubeadm/) was chosen because the `reset` command allows easy turn-up/turn-down of Kubernetes services. In this way, it is easier for us to use while developing the project.

## Install, Destroy,  Repeat

The use of these playbooks are very simple.

**What to Expect:**

* Expect that you will need to change the hostnames in both `inventory.yaml`, and `group_vars/all.yaml`.
* Expect Halcyon to be more flexible and maintained.
* Expect this project to be non-production.
* Expect this project to be uncomplicated, easy, and fun.

**To Deploy:**

The deployment playbooks do three things only: Upgrade the OS, Install the kubeadm master, Install the kubeadm workers.

```
ansible-playbook kube-deploy.yml -i inventory.yml
```

**To Destroy:**

The destroy playbook brings down the cluster.

**To Rebuild:**

The rebuild playbook brings down the cluster and redeploys the cluster.
