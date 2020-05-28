# Vagrant for IoTCheck

Please read our paper before using IoTCheck. 

**Understanding and Automatically Detecting Conflicting Interactions between Smart Home Applications**\
*Rahmadi Trimananda, Seyed Amir Hossein Aqajari, Jason Chuang, Brian Demsky, Guoqing Harry Xu, and Shan Lu,*\
*Proceedings of the ACM SIGSOFT International Symposium on Foundations of Software Engineering 2020 (FSE 2020).*

We have packaged IoTCheck using [Vagrant 1.8.1](https://www.vagrantup.com). We installed and ran Vagrant on Ubuntu 16.04.6 LTS (Xenial Xerus). Nevertheless, Vagrant can run on various operating systems (Linux, Mac OS, Windows, etc.). For more information on how to run Vagrant, please consult its [documentation](https://www.vagrantup.com/docs/index.html).

The provided `Vagrantfile` and `bootstrap.sh` provisioning script will prepare the environment with the required packages to run IoTCheck. We have set up the Vagrant configuration to create a VM that uses 24GB of memory. You can change that by changing the line in the `Vagrantfile` that contains `"--memory", "24552"`. For our experiments with IoTCheck, we set JPF to [use up to 20GB of memory](https://github.com/iotuser22/iotcheck/wiki/IoTCheck-JPF#Run-Script), so a VM with 24GB of memory should be sufficient.

1. In order for Vagrant to run, we should first make sure that the [VT-d option for virtualization is enabled in BIOS](https://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/sect-Virtualization-Troubleshooting-Enabling_Intel_VT_and_AMD_V_virtualization_hardware_extensions_in_BIOS.html).

2. Then, we should download and install Vagrant, if we do not have Vagrant ready on our machine.

```
    $ sudo apt-get install virtualbox
    $ sudo apt-get install vagrant
```

3. We also need to check out this repository into our machine.

```
    $ git clone https://github.com/iotuser22/iotcheck-vagrant.git
```

4. Next, we run Vagrant inside the **iotcheck-vagrant** folder.

```
    iotcheck-vagrant $ vagrant up
```

5. When the provisioning is done and Vagrant is up, we need to ssh into the running Vagrant VM.

```
    iotcheck-vagrant $ vagrant ssh
```
6. Finally, inside we run the setup script to download IoTCheck and set up the environment variables.

```
    $ source /vagrant/data/setup.sh
```

To run the experiments please read README.md in the folder **iotcheck** or on the [IoTCheck Github page](https://github.com/iotuser22/iotcheck). If you have any questions regarding IoTCheck, please do not hesitate to contact the [main author of the paper](https://rtrimana.github.io/cv/).
