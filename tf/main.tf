resource "google_storage_bucket" "caserta" {
  name     = "${var.default_resource_name}"
  location = "${var.default_location}"
}

resource "google_bigquery_dataset" "caserta" {
  dataset_id                  = "coinmarketcap"
  friendly_name               = "CoinMarketCap"
  description                 = "CoinMarketCap API Dataset"
  location                    = "${var.default_location}"
  default_table_expiration_ms = 3600000
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

# This only handles a create and not the entire resource lifecycle, so
# add'l work would be necessary to manage delete/update, but
# it is sufficient to get you started.
resource "null_resource" "datalab_run" {
  depends_on = ["null_resource.datalab_setup"]

  provisioner "local-exec" {
    command     = "./datalab-run.sh"
    interpreter = ["/bin/bash"]

    environment {
      PROJECT             = "${var.project}"
      ZONE                = "${var.default_zone}"
      USR_GCLOUD_BIN_PATH = "${var.local_gcloud_bin_path}"
      RESOURCE            = "${var.default_resource_name}"
    }
  }
}
