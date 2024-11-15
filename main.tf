terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

#Data sources

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_datastore" "dc" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}


data "vsphere_resource_pool" "pool" {
  name          = var.pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

#Resource
resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = var.vm_guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  name = title("${var.prefix}_machine_num_${count.index + 1}")

  num_cpus = var.vm_vcpu
  memory   = var.vm_memory
  firmware = var.vm_firmware
  disk {
    label = var.vm_disk_label
    size  = var.vm_disk_size
    #thin_provisioned	= var.vm_disk_thin
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "machine-${count.index + 1}"
        domain    = var.vm_domain
      }
      network_interface {}
    }
  }
}
