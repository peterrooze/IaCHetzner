output "server_ip" {
  description = "Public IP address of the created server"
  value       = hcloud_server.web.ipv4_address
}