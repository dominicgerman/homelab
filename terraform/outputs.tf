output "node_ips" {
  value = {
    for name, node in local.nodes :
    name => node.ip
  }
}
