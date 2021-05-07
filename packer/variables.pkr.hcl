variables {
   gcp_zone           = "us-central1-a"
   disk_size          = 20
   project_id         = "packer-super-test"
   source_image       = "ubuntu-1804-bionic-v20200716"
   ssh_username       = "packer"
   image_description  = "Packer Built Image"
   machine_type       = "n1-standard-2"
}