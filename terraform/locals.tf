locals {
  nodes = {
    k3s-01 = {
      vm_id  = 221
      ip     = "192.168.1.221"
      cores  = 2
      memory = 4096
      disk   = 40
    }
    k3s-02 = {
      vm_id  = 222
      ip     = "192.168.1.222"
      cores  = 2
      memory = 4096
      disk   = 40
    }
    k3s-03 = {
      vm_id  = 223
      ip     = "192.168.1.223"
      cores  = 2
      memory = 4096
      disk   = 40
    }
    k3s-04 = {
      vm_id  = 224
      ip     = "192.168.1.224"
      cores  = 2
      memory = 4096
      disk   = 40
    }
    k3s-05 = {
      vm_id  = 225
      ip     = "192.168.1.225"
      cores  = 2
      memory = 4096
      disk   = 40
    }
  }
}
