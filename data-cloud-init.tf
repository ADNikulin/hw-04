data template_file "cloudinit" {
  template = file("${path.module}/templates/cloud-init.yml")

  vars = {
    username           = local.userdata.username
    ssh_public_key     = file(local.userdata.ssh_public_key)
    packages           = var.packages
  }
}