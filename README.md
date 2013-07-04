Vagrant-Hadoop-Cluster
======================

This project is used to deploy a simple hadoop cluster, in a public network with static IPs.

It's based on Hadoop 1.1.2, vagrant 1.2.2 and sqoop 1.4.3

Since Vagrant 1.2.2 does not have support for static IPs in public networks, I've created a patch based on fix in https://github.com/jheise/vagrant/commit/7a89ab7fadfd6dcd46d3cdb7d960912d3f2c126f

To run simply "vagrant up" will boot one master and 5 slaves, 
or vagrant up master hadoop1 to boot one master and one slave only.

the VMs run Lucid64 box
