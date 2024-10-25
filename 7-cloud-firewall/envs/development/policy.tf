data "google_compute_network" "base_network" {
  name = local.base_network_name
  project = local.base_host_project_id
}

resource "google_compute_firewall_policy" "default" {
  parent      = local.parent_folder
  short_name  = "test-policy"
  description = "Test policy"
}

resource "google_compute_firewall_policy_rule" "primary" {
  firewall_policy = google_compute_firewall_policy.default.id
  description     = "Firewall policy rule L7"
  priority        = 1000
  enable_logging  = true
  action          = "apply_security_profile_group"
  direction       = "EGRESS"
  disabled        = false
  
  security_profile_group = local.security_profile_group.id
  tls_inspect = true
  
  match {
    layer4_configs {
      ip_protocol = "tcp"
    }
    layer4_configs {
      ip_protocol = "udp"
    }
    dest_ip_ranges = ["0.0.0.0/0"]
    dest_fqdns = []    
  }
  
}

