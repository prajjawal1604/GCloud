# resource "google_compute_instance" "testing-vm" {
#   boot_disk {
#     auto_delete = true
#     device_name = "testing-vm"

#     initialize_params {
#       image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
#       size  = 10
#       type  = "pd-balanced"
#     }

#     mode = "READ_WRITE"
#   }

#   can_ip_forward      = false
#   deletion_protection = false
#   enable_display      = false

#   machine_type = "e2-standard-2"
#   name         = "testing-vm"

#   network_interface {
#     access_config {
#       network_tier = "PREMIUM"
#     }

#     queue_count = 0
#     stack_type  = "IPV4_ONLY"
#     subnetwork  = "projects/gcp-terraform-414508/regions/asia-south1/subnetworks/default"
#   }

#   tags = ["http-server", "https-server", "lb-health-check"]
#   metadata_startup_script = file("${path.module}/deployServer.ps1")
#   zone = "asia-south1-c"
# }


# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "vm-services-drupal" {
  boot_disk {
    auto_delete = true
    device_name = "vm-services-drupal"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  machine_type = "e2-medium"
  name         = "vm-services-drupal"

  network_interface {
    access_config {
      nat_ip = "34.131.141.30"
      network_tier = "PREMIUM"
    }

    # queue_count = 0
    # stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/gcp-terraform-414508/regions/asia-south2/subnetworks/vm-application-subnet"
  }

  tags = ["http-server", "https-server"]
  metadata_startup_script = file("${path.module}/deployServer.ps1")
  zone = "asia-south2-a"
}
