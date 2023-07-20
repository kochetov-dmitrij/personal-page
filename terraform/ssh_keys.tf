resource "digitalocean_ssh_key" "ansible" {
  name       = "ansible-personal-page"
  public_key = file("../keys/ansible_rsa.pub")
}
