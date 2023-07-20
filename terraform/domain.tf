resource "digitalocean_domain" "kochetov-dev" {
  name = "kochetov.dev"
}

resource "digitalocean_record" "cname-apex" {
  domain   = digitalocean_domain.kochetov-dev.id
  type     = "CNAME"
  name     = "@"
  value    = "www.kochetov.dev"
}

resource "digitalocean_record" "cname-www" {
  domain   = digitalocean_domain.kochetov-dev.id
  type     = "CNAME"
  name     = "www"
  value    = "kochetov-dmitrij.github.io"
}
