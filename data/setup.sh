#!/bin/bash

# Install JDK 1.8.0_201 (recent updates to JDK 8 has class structure changes).
sudo mkdir -p /opt/jdk
cd /opt/jdk
sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1SpzLge7g69j5NVmry637P72cU5vpgFGE' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1SpzLge7g69j5NVmry637P72cU5vpgFGE" -O jdk-8u201-linux-x64.tar.gz && rm -rf /tmp/cookies.txt
sudo tar -zxf jdk-8u201-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_201/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_201/bin/javac 100
export JAVA_HOME=/opt/jdk/jdk1.8.0_201
export JRE_HOME=/opt/jdk/jdk1.8.0_201/jre
cd ~

# Download JPF, infrastructure, and apps
git clone https://github.com/uci-plrg/iotcheck.git

# Compile JPF
cd iotcheck/jpf-core/
./gradlew

# Extract Groovy libraries
cd lib/
mkdir groovy-2.5.7
mkdir groovy-dateutil-2.5.7
mkdir groovy-json-2.5.7
unzip groovy-2.5.7.jar -d groovy-2.5.7
unzip groovy-dateutil-2.5.7.jar -d groovy-dateutil-2.5.7
unzip groovy-json-2.5.7.jar -d groovy-json-2.5.7
cd ../../../

# Extract Groovy compiler and set up environment variables
unzip /vagrant/data/apache-groovy-sdk-2.5.8.zip -d .
source iotcheck/jpf-core/lib/setenv.sh $PWD
echo "source ./iotcheck/jpf-core/lib/setenv.sh $PWD" >> ~/.bashrc


# Download the SmartThings infrastructure for JPF model checker
cd iotcheck/smartthings-infrastructure
mkdir Extractor/App1
mkdir Extractor/App2
cd ..

# Final setup
mkdir logs
# Device Interaction
# Alarms
mkdir logs/alarms
# Cameras
mkdir logs/cameras
# Dimmers
mkdir logs/dimmers
# Switches sub-groups
mkdir logs/lightSwitches
mkdir logs/switches
mkdir logs/acfanheaterSwitches
mkdir logs/cameraSwitches
mkdir logs/ventfanSwitches
# Lights sub-groups
mkdir logs/nonHueLights
mkdir logs/hueLights
# Locks
mkdir logs/locks
# Music Players
mkdir logs/musicPlayers
# Relay Switches
mkdir logs/relaySwitches
# Speech Synthesizers
mkdir logs/speeches
# Thermostats
mkdir logs/thermostats
# Valves
mkdir logs/valves

# Global-Variable Interaction
mkdir logs/globalStateVariables

# Examples
mkdir logs/exampleConflicts
mkdir logs/exampleNonConflicts
cd ..
