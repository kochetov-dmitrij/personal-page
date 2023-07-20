data "cloudflare_accounts" "all" {
  name = "example account"
}

data "cloudflare_zone" "kochetov-dev" {
  zone = "kochetov.dev"
}

resource "cloudflare_record" "cname-apex" {
  zone_id = data.cloudflare_zone.kochetov-dev.id
  name    = "@"
  value   = "www.kochetov.dev"
  type    = "CNAME"
  ttl     = 600
  proxied = false
}

resource "cloudflare_record" "cname-www" {
  zone_id = data.cloudflare_zone.kochetov-dev.id
  name    = "www"
  value   = "kochetov-dmitrij.github.io"
  type    = "CNAME"
  ttl     = 600
  proxied = false
}
