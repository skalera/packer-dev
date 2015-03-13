#!/bin/sh -e

# Add the repository to your APT sources
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
apt-get -qq update
apt-get -qq install -y lxc-docker

usermod --groups docker vagrant

# pull in images we're going to use later

docker pull progrium/consul
docker pull progrium/registrator
docker pull redis
docker pull nginx
docker pull postgres
docker pull skalera/influxdb

# add influx command to VM image
wget -O /usr/bin/influx https://s3-us-west-2.amazonaws.com/skalera/vagrant/influx-0.9.0_rc11
chmod 755 /usr/bin/influx
