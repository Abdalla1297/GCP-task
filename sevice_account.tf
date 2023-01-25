resource "google_project_iam_custom_role" "customRole" {
  role_id     = "myCustomRole"
  title       = "MyCustomRole"
  description = "A description"
  permissions = ["resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" , "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" , "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,"container.nodes.list" , "container.ingresses.create" ]
}
#create new service account for gke 
resource "google_service_account" "project-service-account" {
  account_id = "project-service-account"
  project = "abdallah-iti"
}
#grant permissions for service account
resource "google_project_iam_binding" "project-service-account-iam"{
  project = "abdallah-iti"
  role    = "projects/${google_service_account.project-service-account.project}/roles/${google_project_iam_custom_role.customRole.role_id}"
  members = [
    "serviceAccount:${google_service_account.project-service-account.email}"
  ]
}
