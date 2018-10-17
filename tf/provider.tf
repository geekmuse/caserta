terraform {
  required_version = "= 0.11.8"
}

provider "google" {
  version     = "= 1.19.1"
  credentials = "${file("caserta-219701-91af9e94be1a.json")}"
  project     = "${var.project}"
  region      = "${var.default_region}"
}
