#!/usr/bin/env bash

# Download and install Java and unzip
apt-get update
apt-get install -y openjdk-8-jdk
apt-get install -y unzip
apt-get install -y make
su -c /vagrant/data/setup.sh vagrant
