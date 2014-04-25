unless Vagrant.has_plugin?("vagrant-babushka") || ARGV[0] == 'plugin'
  origargs = ARGV.join(" ");
  puts "babushka plugin not found"
  exec "vagrant plugin install vagrant-babushka;vagrant #{origargs}"
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision :babushka do |babushka|
    babushka.local_deps_path = 'babushka-deps'
    
    babushka.meet 'node-dev-environment'
  end
end
