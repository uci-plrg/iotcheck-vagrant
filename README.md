# Vagrant for IoTCheck

We have packaged IoTCheck using [Vagrant 1.8.1](https://www.vagrantup.com). Technically, Vagrant can run on various operating systems (Linux, Mac OS, Windows, etc.). The following instructions were tested on Ubuntu 16.04.6 LTS (Xenial Xerus). For more information on how to run Vagrant, please consult its [documentation](https://www.vagrantup.com/docs/index.html).

1. In order for Vagrant to run, we should first make sure that the [VT-d option for virtualization is enabled in BIOS](https://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Troubleshooting-Enabling_Intel_VT_and_AMD_V_virtualization_hardware_extensions_in_BIOS.html).

2. Then, we should download and install Vagrant, if we do not have Vagrant ready on our machine.

```
    $ sudo apt-get install virtualbox
    $ sudo apt-get install vagrant
```

3. Next, we run Vagrant inside the "iotcheck-vagrant" folder.

```
    iotcheck-vagrant $ vagrant up
```

4. When the provisioning is done and Vagrant is up, we need to ssh into the running Vagrant VM.

```
    iotcheck-vagrant $ vagrant ssh
```
5. Finally, inside we run the setup script to download IoTCheck and set up the environment variables.

```
    $ source /vagrant/data/setup.sh
```

The provided `Vagrantfile` and `bootstrap.sh` provisioning script will prepare the environment with the required packages to run IoTCheck. We have set up the Vagrant configuration to create a VM that uses 16GB of memory. You can change that by changing the line in the `Vagrantfile` that contains `"--memory", "16384"`.

To run the experiments please read README.md in the folder **iotcheck** or on the [IoTCheck Github page](https://github.com/iotuser22/iotcheck).
