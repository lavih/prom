# Project Title

Prometheus-Graphite-Grafana monitoring stack - Docker based.

## Description

Building a Prometheus-Graphite-Grafana monitoring stack that will monitor a host VM performance - cpu,ram,disk space etc.

## Getting Started

The following project goal is to Start a ubuntu based vm , run/install collectors on the vm and deploy on top of it a docker based stack of Prometheus-Graphite-Grafana
in order to monitor the vm using Grafana Dashboards.

### Dependencies

* VirtualBox with vboxmanage cli tool ver 5.2.34 - make sure the commands is executable via the user's PATH
* Ubuntu 16.04 iso - to create a vm on VBOX
* Docker version 19.03.8 - installation process on installs.txt file
* Docker-Compose cli tool - 1.25.5 - installation process on installs.txt file


### Installing
* after we made sure we installed all the dependencies in the "Dependencies" section:
* The project comes with prom.tar.gz compressed file, move it into the ubuntu vm
* some of the scripts try to install packages - run with user with sufficient permissions
* unzip:
tar -xvzf prom.tar.gz
* run/install collectors on vm - Make sure you run the shell scripts with sufficient permissions - the scripts need root permissions.
cd prom
sh collectd/run_install_collectd.sh
sh node_exporter/run_node_exporter.sh

### Executing the program ####
cd prom && docker-compose -f docker-compose.yaml up -d

### Access ####
To see the stack you installed access the vm machine with web browser on port 3000. example 10.0.0.1:3000
enter the dashboards section and you will see 2 dashboards to monitor the host_VM:
1. Graphite dashboard - Based on collectd collector tool
2. Prometheus dashboards - Based on node_exporter exporter tool

Any advise for common problems or issues.
1. make sure node exporter is running : netstat -tulnp | grep 9100
if not, run: ./prom/node_exporter/node_exporter

2. make sure collectd was installed and running: systemctl status collectd
if not check why the script "collectd/run_install_collectd.sh" installed the package. if not make
sure you run it with sufficient permissions

3. the stack will create a few volumes - make sure you have enough disk-space: df -ah

4. some of the scripts copy files from the relative path. try to run from inside prom directory like so:
cd prom/node_exporer && sh run_node_exporter.sh

## Authors

Lavih
example@example.com


## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
# github repos
*https://github.com/prometheus/prometheus
*https://github.com/graphite-project
*https://github.com/grafana/grafana

#docs
*https://graphiteapp.org/
*https://grafana.com/
*https://prometheus.io/

# docker images
*https://hub.docker.com/r/prom/prometheus
*https://hub.docker.com/r/graphiteapp/graphite-statsd

