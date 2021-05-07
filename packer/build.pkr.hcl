build {
  sources = ["sources.googlecompute.basic-example"]

    provisioner "ansible" {
    playbook_file = "../ansible/playbook.yml"
  }
  
}