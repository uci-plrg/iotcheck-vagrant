#!/bin/bash

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
