resource "digitalocean_droplet" "kochetov-dev" {
  name          = "kochetov-dev"
  image         = "ubuntu-22-04-x64"
  region        = "fra1"
  size          = "s-1vcpu-1gb"
  ssh_keys      = [digitalocean_ssh_key.personal_page.fingerprint]
  backups       = false
  droplet_agent = true
  monitoring    = true
}
