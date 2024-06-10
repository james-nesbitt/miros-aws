// Launchpad configuration
variable "launchpad" {
  description = "launchpad install configuration"
  type = object({
    drain = bool

    mcr_version = string
    mke_version = string
    msr_version = string // unused if you have no MSR hosts

    mke_connect = object({
      username = string
      password = string
      insecure = bool // true if this endpoint will not use a valid certificate
    })

    skip_create  = bool
    skip_destroy = bool
  })
}
