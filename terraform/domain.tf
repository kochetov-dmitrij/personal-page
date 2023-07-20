data "cloudflare_accounts" "all" {
  name = "example account"
}

data "cloudflare_zone" "kochetov-dev" {
  name = "kochetov.dev"
}

resource "cloudflare_record" "a-apex" {
  zone_id = data.cloudflare_zone.kochetov-dev.id
  name    = "@"
  value   = digitalocean_droplet.kochetov-dev.ipv4_address
  type    = "A"
  ttl     = 600
  proxied = false
}
