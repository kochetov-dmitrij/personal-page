data "cloudflare_accounts" "all" {
  name = "example account"
}

resource "cloudflare_zone" "kekochetov-dev" {
  zone = "kekochetov.dev"
  account_id = var.cloudflare_account_id
}

resource "cloudflare_record" "cname-apex" {
  zone_id = cloudflare_zone.kekochetov-dev.id
  name    = "@"
  value   = "www.kochetov.dev"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "cname-www" {
  zone_id = cloudflare_zone.kekochetov-dev.id
  name    = "www"
  value   = "kochetov-dmitrij.github.io"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}
