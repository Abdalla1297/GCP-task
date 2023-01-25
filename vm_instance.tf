resource "google_compute_instance" "private_vm_instance" {
  name         = "private-vm-instance"
  machine_type = "e2-micro"
  zone         = "us-east4-b"
  allow_stopping_for_update = true

  depends_on = [
    google_container_cluster.private-cluster
   , google_container_node_pool.nodepool
  ]
   metadata_startup_script = <<-EOF
                                #
                                sudo apt install -y apt-transport-https ca-certificates gnupg
                                echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
                                curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
                                sudo apt-get update && sudo apt-get install -y google-cloud-cli
                                sudo apt-get install kubectl 
                                sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
                                  EOF

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 30
    
    }
  }
 
  network_interface {
    network = module.network.vpc_name_output
    subnetwork = module.network.subnet_1_name_output
   
  }
  service_account {
        email = google_service_account.project-service-account.email
        scopes = [ "cloud-platform" ]
}

}