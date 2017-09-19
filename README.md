# vagrant
basic ubuntu vagrant template


INSTALLATION REQUIREMENTS
------------
  - GIT
  - VirtualBox
  - Vagrant
  - Vagrant hostmanager pulugin
  - console or terminal
  - 512 Memory 
  
INSTALLATION
------------
1. Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. Install [vagrant](https://www.vagrantup.com/)
4. Clone into proper folder  
5. Copy ./vagrant/config/vagrant-local.example.yml as ./vagrant/config/vagrant-local.yml
6. Setup proxy in system variables and restart your console. In needed
6. Install [vagrant hostmanager pulugin](https://github.com/devopsgroup-io/vagrant-hostmanager)
7. Install [vagrant proxyconf pulugin](https://github.com/tmatilai/vagrant-proxyconf) if you need to use proxy
8. Take a short look at vagrant-local.yml settings if all ok
9. Start [vagrant](https://www.vagrantup.com/docs/getting-started/)

```sh
$ git clone https://github.com/MaksymSemenykhin/vagrant.git ./vagrant
$ cd ./vagrant
$ vagrant plugin install vagrant-hostmanager
$ vagrant plugin install vagrant-proxyconf
$ vagrant up
$ vagrant global-status
```
  
