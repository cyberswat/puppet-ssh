# == Class: ssh::service
#
# Manages the ssh server service.
#
# === Parameters
#
# [*puppet_server_service*]
#   The name of the registered puppet master service.
#
class ssh::service inherits ssh::params {
  service { $ssh::params::ssh_server_service:
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
  }
}

