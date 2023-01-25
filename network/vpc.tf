resource "google_compute_network" "my_vpc" {
  project                 = "abdallah-iti"
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}