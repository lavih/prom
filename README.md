# Project Title

Prometheus-Graphite-Grafana monitoring stack

## Description

Building a Prometheus-Graphite-Grafana monitoring stack that will monitor the host machine performance - cpu,ram,disk space etc

## Getting Started

The following project goal is to Start a ubuntu based vm , run/install collectors on the vm and deploy on top of it a docker based stack of Prometheus-Graphite-Grafana
in order to monitor the vm.

### Dependencies

* Ubuntu 16.04
* Docker version 19.03.8
* Docker-Compose - 1.25.5 - installation process on installs.txt file
* VirtualBox with vboxmanage cli tool ver 5.2.34 - make sure the commands is executable via the user's PATH

### Installing
* after we made sure we installed all the dependencies in the "Dependencies" section:
* The project comes with prom.tar.gz compressed file, move it into the ubuntu vm
* unzip:
tar -xvzf prom.tar.gz
* run/install collectors on vm
sh ./prom/collectd/run_install_collectd.sh
sh ./prom/node_exporter/run_node_exporter.sh

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

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

