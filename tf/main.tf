resource "google_storage_bucket" "caserta" {
  name     = "bsc-caserta-datatest"
  location = "US"
}

resource "google_bigquery_dataset" "caserta" {
  dataset_id                  = "coinmarketcap"
  friendly_name               = "CoinMarketCap"
  description                 = "CoinMarketCap API Dataset"
  location                    = "US"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "caserta" {
  dataset_id = "${google_bigquery_dataset.caserta.dataset_id}"
  table_id   = "bar"

  time_partitioning {
    type = "DAY"
  }
}

resource "null_resource" "datalab_setup" {
  provisioner "local-exec" {
    command     = "./datalab-setup.sh"
    interpreter = ["/bin/bash"]

    environment {
      USR_GCLOUD_BIN_PATH = "${var.local_gcloud_bin_path}"
    }
  }
}

resource "null_resource" "datalab_run" {
  depends_on = ["null_resource.datalab_setup"]

  provisioner "local-exec" {
    command     = "./datalab-run.sh"
    interpreter = ["/bin/bash"]

    environment {
      PROJECT             = "${var.project}"
      ZONE                = "${var.default_zone}"
      USR_GCLOUD_BIN_PATH = "${var.local_gcloud_bin_path}"
    }
  }
}
