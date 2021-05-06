source "googlecompute" "basic-example" {
  project_id = "packer-super-test"
  source_image = "ubuntu-1804-bionic-v20200716"
  ssh_username = "packer"
  zone = "us-central1-a"
}