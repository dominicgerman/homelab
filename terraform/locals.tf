locals {
  nodes = {
    control-1 = {
      vm_id  = 220
      ip     = "192.168.1.220"
      cores  = 2
      memory = 4096
      disk   = 40
    }
    worker-1 = {
      vm_id  = 221
      ip     = "192.168.1.221"
      cores  = 2
      memory = 4096
      disk   = 40
    }

    worker-2 = {
      vm_id  = 222
      ip     = "192.168.1.222"
      cores  = 2
      memory = 4096
      disk   = 40
    }
  }
}
