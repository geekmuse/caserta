variable "project" {
  description = "Project name"
  default     = "caserta-219701"
}

variable "default_zone" {
  description = "Default project zone"
  default     = "us-central1-c"
}

variable "local_gcloud_bin_path" {
  description = "Local gcloud bin PATH"
  default     = "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
}

variable "default_region" {
  description = "Google region"
  default     = "us-central1"
}

variable "default_resource_name" {
  description = "Generic resource name"
  default     = "bsc-caserta-datatest"
}

variable "default_location" {
  description = "Default Google resource location"
  default     = "US"
}
