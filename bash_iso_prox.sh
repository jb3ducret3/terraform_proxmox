#!/bin/bash

# Téléchargement de l'image cloud Ubuntu
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img -O /chemin/vers/le/dossier/ubuntu.img

# Création de la VM Ubuntu
ubuntu_version="18.04"
memory_size="2048"  # Taille de la mémoire en Mo
num_cores="2"       # Nombre de cœurs
vm_id="100"         # ID de la VM

qm create "$vm_id" -name "ubuntu-$ubuntu_version-template" -memory "$memory_size" -net0 virtio,bridge=vmbr1 -cores "$num_cores" -sockets 1 -cpu cputype=kvm64 -description "Ubuntu $ubuntu_version Cloud Image" -kvm 1 -numa 1

# Téléchargement de l'image cloud Windows 10
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img -O /chemin/vers/le/dossier/windows10.img

# Création de la VM Windows 10
windows_version="10"
memory_size="4096"  # Taille de la mémoire en Mo
num_cores="4"       # Nombre de cœurs
vm_id="101"         # ID de la VM

qm create "$vm_id" -name "windows-$windows_version-template" -memory "$memory_size" -net0 virtio,bridge=vmbr1 -cores "$num_cores" -sockets 1 -cpu cputype=kvm64 -description "Windows $windows_version Cloud Image" -kvm 1 -numa 1
