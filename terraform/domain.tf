data "cloudflare_accounts" "all" {
  name = "example account"
}

resource "cloudflare_zone" "kekochetov-dev" {
  zone = "kekochetov.dev"
  account_id = var.cloudflare_account_id
}

resource "cloudflare_record" "cname-lol" {
  zone_id = cloudflare_zone.kekochetov-dev.id
  name    = "lol"
  value   = "example.com"
  type    = "CNAME"
  ttl     = 3600
}
