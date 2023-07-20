resource "scaleway_instance_ip" "personal_page_public_ip" {}

resource "scaleway_instance_security_group" "personal_page" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action   = "accept"
    port     = "22"
    ip_range = "0.0.0.0/0"
  }
  inbound_rule {
    action = "accept"
    port   = "80"
  }
  inbound_rule {
    action = "accept"
    port   = "443"
  }
}

resource "scaleway_instance_server" "personal_page" {
  type       = "DEV1-S"
  image      = "ubuntu_jammy"

  ip_id = scaleway_instance_ip.personal_page_public_ip.id
  additional_volume_ids = [scaleway_instance_volume.personal_page_data.id]

  root_volume {
    size_in_gb = 15
  }

  security_group_id = scaleway_instance_security_group.personal_page.id
}

resource "scaleway_instance_volume" "personal_page_data" {
  size_in_gb = 15
  type       = "b_ssd"
}
