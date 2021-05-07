source "googlecompute" "basic-example" {
  project_id      = var.project_id
  source_image    = var.source_image
  zone            = var.gcp_zone
  disk_size       = var.disk_size
  ssh_username    = var.ssh_username
  machine_type    = var.machine_type
  image_description = var.image_description
}