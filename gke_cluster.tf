resource "google_container_cluster" "private-cluster" {
  name                     = "private-standerd-gke-cluster"
  location                 =    "us-east4-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_name
  subnetwork               = var.subnet_2_name

  node_locations = [
    "us-east4-c"
   
  ]
    depends_on = [
    module.network
  ]
  ip_allocation_policy {

  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "managment-cidr-range"
    }
  }

  node_config {
    service_account = google_service_account.project-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform" 
    ]
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_container_node_pool" "nodepool" {
  name       = "node-pool"
  cluster    = google_container_cluster.private-cluster.id
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    service_account = google_service_account.project-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform" 
    ]
  }
}