variable "service_account" {
  description = "Service account key used to access resources during provisioning"
  type        = string
}

variable "gcp_project" {
  description = "Name of the Google Cloud Platform project where services will be provisioned"
  type        = string
}

variable "region" {
  description = "Region where instances and services will be deployed in GCP"
  type        = string
}

variable "zone" {
  description = "Zone within the specified region for service deployment"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine hosting the service"
  type        = string
}

variable "machine_type" {
  description = "Type of virtual machine used for hosting the service"
  type        = string
}

variable "os_image" {
  description = "Base operating system image for virtual machine creation"
  type        = string
}

variable "vm_disk_size" {
  description = "Size of the disk associated with the virtual machine for data storage"
  type        = number
}

variable "vm_disk_type" {
  description = "Type of disk associated with the virtual machine"
  type        = string
}

variable "script" {
  description = "Script used for post-deployment service installation in production and QA environments"
  type        = string
}
