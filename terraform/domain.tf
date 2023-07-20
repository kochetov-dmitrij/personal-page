data "cloudflare_accounts" "all" {
  name = "example account"
}

resource "cloudflare_zone" "kek-kochetov-dev" {
  zone = "kek.kochetov.dev"
}

resource "cloudflare_record" "cname-lol" {
  zone_id = cloudflare_zone.kek-kochetov-dev.id
  name    = "lol"
  value   = "example.com"
  type    = "CNAME"
  ttl     = 3600
}
