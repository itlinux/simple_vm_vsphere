#Provider -  VMware vSphere Provider


variable "vm_count" {
  default = "2"
}

variable "prefix" {
  default = "ubuntu"
}
variable "pool_name" {
  default = "graid"
}

variable "vsphere_user" {
  description = "vSphere username to use to connect to the environment"
  default     = "administrator"
}

variable "vsphere_password" {
  description = "vSphere password to use to connect to the environment"
  default     = ""
}

variable "vsphere_server" {
  description = "vCenter server FQDN or IP"
  default     = "172.18.0.27"
}

# Infrastructure - vCenter / vSPhere environment

variable "vsphere_datacenter" {
  description = "vSphere datacenter in which the virtual machine will be deployed"
  default     = "datacenter"
}

variable "vsphere_host" {
  description = "vSphere ESXi host FQDN or IP"
  default     = "172.18.0.27"
}

variable "vsphere_compute_cluster" {
  description = "vSPhere cluster in which the virtual machine will be deployed"
  default     = ""
}

variable "vsphere_datastore" {
  description = "Datastore in which the virtual machine will be deployed"
  default     = "Datastore2"
}

variable "vsphere_network" {
  description = "Portgroup to which the virtual machine will be connected"
  default     = "VM Network 2"
}

variable "vm_firmware" {
  description = "Firmware of virtual machine, if templates is different from default"
  default     = "efi"
}

#VM

variable "vm_template_name" {
  description = "VM template with vmware-tools and perl installed"
  default     = "Ubuntu-base-22-04"
}

variable "vm_guest_id" {
  description = "VM guest ID"
  default     = "ubuntu64Guest"
}

variable "vm_vcpu" {
  description = "The number of virtual processors to assign to this virtual machine."
  default     = "1"
}

variable "vm_memory" {
  description = "The size of the virtual machine's memory in MB"
  default     = "2048"
}

variable "vm_domain" {
  description = "Domain name of virtual machine"
  default     = "testremo.com"
}

variable "vm_disk_label" {
  description = "Disk label of the created virtual machine"
  default     = "demo1"
}

variable "vm_disk_size" {
  description = "Disk size of the created virtual machine in GB"
  default     = "40"
}

variable "vm_disk_thin" {
  description = "Disk type of the created virtual machine , thin or thick"
  default     = "thin"
}
