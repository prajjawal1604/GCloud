resource "google_compute_instance" "test-vm-joomla-prashanti" {
  boot_disk {
    auto_delete = true
    device_name = "test-vm-joomla-prashanti"

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
  name         = "test-vm-joomla-prashanti"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/devops-test-ford/regions/us-east1/subnetworks/default"
  }

  tags = ["http-server", "https-server"]
  metadata_startup_script = file("${path.module}/joomlaInstalation.sh")
  zone = "us-east1-b"
}

