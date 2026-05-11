variable "project_id" {
  description = "Google Cloud project ID for the secure delivery platform baseline."
  type        = string
}

variable "region" {
  description = "Google Cloud region for regional baseline resources."
  type        = string
  default     = "us-central1"
}

variable "enabled_services" {
  description = "Google Cloud APIs required for the MVP trusted release baseline."
  type        = set(string)
  default = [
    "artifactregistry.googleapis.com",
    "binaryauthorization.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddeploy.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
  ]
}

variable "artifact_registry_repository_id" {
  description = "Artifact Registry Docker repository ID for release candidate images."
  type        = string
  default     = "secure-delivery"
}

variable "artifact_registry_description" {
  description = "Description for the Artifact Registry repository used by the trusted release path."
  type        = string
  default     = "Container images for the secure delivery platform trusted release path."
}

variable "build_service_account_id" {
  description = "Service account ID for the build and verification identity."
  type        = string
  default     = "secure-delivery-build"
}

variable "deploy_service_account_id" {
  description = "Service account ID for the deployment identity."
  type        = string
  default     = "secure-delivery-deploy"
}

variable "reviewer_service_account_id" {
  description = "Service account ID for the release reviewer identity."
  type        = string
  default     = "secure-delivery-reviewer"
}
