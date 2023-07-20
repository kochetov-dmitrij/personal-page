resource "digitalocean_ssh_key" "personal_page" {
  name       = "personal_page"
  public_key = file("../keys/personal_page.pub")
}
