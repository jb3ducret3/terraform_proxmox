resource "proxmox_vm_qemu" "ubuntu_vms" {
  count       = 5
  name        = "ubuntu-${count.index + 1}"
  target_node = "<nom_du_noeud_proxmox>"
  clone       = "<nom_du_template_ubuntu>"
  os_type     = "l26"  # Ubuntu Linux 64-bit
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    size    = "20G"
    type    = "scsi"
    storage = "local"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=192.168.1.10${count.index + 1}/24,gw=192.168.1.1"
  sshkeys   = var.ssh_key
}

resource "proxmox_vm_qemu" "windows_vm" {
  name        = "windows-10"
  target_node = "<nom_du_noeud_proxmox>"
  clone       = "<nom_du_template_windows>"
  os_type     = "win10"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 4096
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    size    = "40G"
    type    = "scsi"
    storage = "local"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  sshkeys = var.ssh_key
}
