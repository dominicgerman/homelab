resource "proxmox_virtual_environment_vm" "node" {
  for_each = local.nodes

  vm_id     = each.value.vm_id
  name      = each.key
  node_name = var.proxmox_node
  started   = true

  clone {
    vm_id = 9000
  }

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "${each.value.ip}/24"
        gateway = var.gateway
      }
    }

    user_account {
      username = "debian"
      keys = [
        trimspace(file("~/.ssh/id_ed25519.pub"))
      ]
    }
  }

  agent {
    enabled = true
  }

  operating_system {
    type = "l26"
  }

  lifecycle {
    ignore_changes = [
      initialization[0].user_account[0].keys
    ]
  }

  virtiofs {
    mapping = "k3s"
  }
}
