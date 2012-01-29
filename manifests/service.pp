# == Class: ssh::service
#
# Manages the ssh server service.
#
# === Parameters
#
# [*ssh_server_service*]
#   The name of the registered ssh server service.
#
class ssh::service inherits ssh::params {
  service { $ssh::params::ssh_server_service:
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
  }
}

