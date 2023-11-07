resource "virtualbox_vm" "node" {
  count = 1
  name = format("node-%02d", count.index + 1)
  #image     = "https://app.vagrantup.com/ubuntu/boxes/focal64/versions/20231011.0.0/providers/virtualbox/unknown/vagrant.box"
  image = "~/vagrant.box"
  cpus = 2
  memory = 1024
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type = "nat"
    #host_interface = "vboxnet1"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

#output "IPAddr_2" {
#  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
#}