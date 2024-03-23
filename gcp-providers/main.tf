# resource "google_storage_bucket" "GCS1" {
#   name = "bucket-prajjawal-from-tf-1"
#   location = "ASIA-SOUTH1"
# }

resource "google_compute_network" "custom-vpc-tf" {
  name = "custom-vpc-tf"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "sub-in" {
  name = "sub-in"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "10.1.0.0/24"
  region = "asia-south1"
}