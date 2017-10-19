Vagrant.configure(2) do |config|
  config.vm.box = 'wondersistemas/rails-development-32'
  config.vm.box_url = 'http://wonder.com.br:81/vagrant/rails-development-32-0.1.0.box'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Utilizando RSync para poder utilizar o guard/livereload
  config.vm.synced_folder '.', '/vagrant', rsync_auto: true
  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'

  # config.proxy.http     = "http://vitor:wondersi@192.168.0.1:3128"
  # config.proxy.https    = "http://vitor:wondersi@192.168.0.1:3128"
  # config.proxy.no_proxy = "http://vitor:wondersi@192.168.0.1:3128"

  config.vm.provider 'virtualbox' do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    # Customize the amount of memory on the VM:
    vb.memory = '2048'
  end

  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = ["cookbooks"]
  #   chef.log_level = :debug
  #   chef.add_recipe "main"
  # end
end
