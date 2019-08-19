Vagrant.configure(2) do |config|
  config.vm.define "nxos1" do |nxos|
    nxos.vm.box = "n9k"
    nxos.ssh.insert_key = false
    nxos.vm.boot_timeout = 900
    nxos.vm.synced_folder '.', '/vagrant', disabled: true
    nxos.vm.network :forwarded_port, guest: 80, host: 8880, id: 'http'
    nxos.vm.network :forwarded_port, guest: 22, host: 4822, id: 'ssh'
    nxos.vm.network :forwarded_port, guest: 830, host: 8830, id: 'netconf'
    nxos.vm.network "private_network", auto_config: false, virtualbox__intnet: "link1"
    nxos.vm.network "private_network", auto_config: false, virtualbox__intnet: "link2"
    nxos.vm.provider :virtualbox do |vb|
      vb.name = "nxos1"
      vb.customize ['modifyvm',:id,'--uartmode1','server','/tmp/nxos1']
      vb.customize ['modifyvm',:id,'--nicpromisc2','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc3','allow-all']
      vb.customize "pre-boot", [ 
                        "storageattach", :id,
                        "--storagectl", "SATA",
                        "--port", "1",
                        "--device", "0",
                        "--type", "dvddrive",
                        "--medium", "./nxos1.iso"
       ]
    end
  end

  config.vm.define "iosxe1" do |iosxe|
    iosxe.vm.box = "iosxe/16.06.02"
    iosxe.ssh.insert_key = false
    iosxe.vm.boot_timeout = 600
    iosxe.vm.synced_folder '.', '/vagrant', disabled: true
    iosxe.vm.network :forwarded_port, guest: 80, host: 8980, id: 'http'
    iosxe.vm.network :forwarded_port, guest: 22, host: 4922, id: 'ssh'
    iosxe.vm.network :forwarded_port, guest: 830, host: 8930, id: 'netconf'
    iosxe.vm.network "private_network", auto_config: false, virtualbox__intnet: "link1"
    iosxe.vm.network "private_network", auto_config: false, virtualbox__intnet: "link2"
    iosxe.vm.provider :virtualbox do |vb|
      vb.name = "iosxe1"
      vb.customize ['modifyvm',:id,'--uartmode1','server','/tmp/iosxe1']
      vb.customize ['modifyvm',:id,'--nicpromisc2','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc3','allow-all']
    end
  end
end

