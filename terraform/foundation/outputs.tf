output "artifact_registry_repository_id" {
  description = "Artifact Registry repository ID used for release candidate images."
  value       = google_artifact_registry_repository.release_images.repository_id
}

output "artifact_registry_location" {
  description = "Artifact Registry repository location."
  value       = google_artifact_registry_repository.release_images.location
}

output "artifact_registry_image_prefix" {
  description = "Docker image prefix for images published to the trusted release repository."
  value       = "${google_artifact_registry_repository.release_images.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.release_images.repository_id}"
}

output "gke_cluster_name" {
  description = "Name of the MVP GKE cluster."
  value       = google_container_cluster.platform.name
}

output "gke_cluster_location" {
  description = "Location of the MVP GKE cluster."
  value       = google_container_cluster.platform.location
}

output "environment_namespaces" {
  description = "Kubernetes namespaces used for MVP environment progression."
  value       = sort(tolist(var.environment_namespaces))
}

output "build_service_account_email" {
  description = "Build and verification service account email."
  value       = google_service_account.build.email
}

output "deploy_service_account_email" {
  description = "Deployment service account email."
  value       = google_service_account.deploy.email
}

output "node_service_account_email" {
  description = "GKE node service account email."
  value       = google_service_account.node.email
}

output "reviewer_service_account_email" {
  description = "Release reviewer service account email."
  value       = google_service_account.reviewer.email
}
