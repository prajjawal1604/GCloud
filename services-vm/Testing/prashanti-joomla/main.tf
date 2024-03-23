resource "google_compute_instance" "joomla-vm" {
  name = var.vm_name
  machine_type = var.machine_type

  boot_disk {
    auto_delete = true
    device_name = var.vm_name

    initialize_params {
      image = var.os_image
      size  = var.vm_disk_size
      type  = var.vm_disk_type
    }

    mode = "READ_WRITE"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/devops-test-ford/regions/${var.region}/subnetworks/default"
  }

  tags = ["http-server", "https-server"]
  zone = "${var.region}-${var.zone}"
}