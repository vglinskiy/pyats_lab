# pyATS playground
Follow instruction https://github.com/hpreston/vagrant_net_prog/tree/master/box_building to build IOS-XE Vagrant box

 config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbooks/ansible_provision.yaml"
    ansible.inventory_path = "./ansible/hosts"
