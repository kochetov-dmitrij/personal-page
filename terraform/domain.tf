resource "cloudflare_zone" "kek-kochetov-dev" {
  account_id = "673f961417e6af4b1a0e4dd19ef17af4"
  zone       = "kek.kochetov.dev"
}

resource "cloudflare_record" "cname-lol" {
  zone_id = cloudflare_zone.kek-kochetov-dev
  name    = "lol"
  value   = "example.com"
  type    = "CNAME"
  ttl     = 3600
}
