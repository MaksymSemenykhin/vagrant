require 'yaml'
require 'fileutils'

domains = {
    main: 'linux.local',
}

config = {
  local: './vagrant/config/vagrant-local.yml',
  example: './vagrant/config/vagrant-local.example.yml'
}

# copy config from example if local config not exists
FileUtils.cp config[:example], config[:local] unless File.exist?(config[:local])
# read config
options = YAML.load_file config[:local]


# vagrant configurate
Vagrant.configure(2) do |config|
  # select the box
  config.vm.box = options['vmbox']
    
  if Vagrant.has_plugin?("vagrant-proxyconf") && options['proxy_use'] == true
     config.proxy.http     = options['proxy_http']
     config.proxy.https    = options['proxy_https']
     config.proxy.no_proxy = options['no_proxy']
  end
    

  # should we ask about box updates?
  config.vm.box_check_update = options['box_check_update']

  config.vm.provider 'virtualbox' do |vb|
    # machine cpus count
    vb.cpus = options['cpus']
    # machine memory size
    vb.memory = options['memory']
    # machine name (for VirtualBox UI)
    vb.name = options['machine_name']
  end

  # machine name (for vagrant console)
  config.vm.define options['machine_name']

  # machine name (for guest machine console)
  config.vm.hostname = options['machine_name']

  # network settings
  config.vm.network 'private_network', ip: options['ip']

  config.vm.synced_folder './'         , '/app'         , owner: 'vagrant', group: 'vagrant'
  config.vm.synced_folder './vagrant/provision', '/home/vagrant', owner: 'vagrant', group: 'vagrant'

  # disable folder '/vagrant' (guest machine)
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # hosts settings (host machine)
  config.vm.provision :hostmanager
  config.hostmanager.enabled            = true
  config.hostmanager.manage_host        = true
  config.hostmanager.ignore_private_ip  = false
  config.hostmanager.include_offline    = true
  config.hostmanager.aliases            = domains.values

  # provisioners
  config.vm.provision 'shell', path: './vagrant/provision/once-as-root.sh', args: [
    options['timezone'],
    options['swap']
  ]

  config.vm.provision 'shell', path: './vagrant/provision/once-as-vagrant.sh', args: [], privileged: false
  config.vm.provision 'shell', path: './vagrant/provision/always-as-root.sh', run: 'always'

  # post-install message (vagrant console)
  config.vm.post_up_message = "Main URL: http://#{domains[:main]}"

end
