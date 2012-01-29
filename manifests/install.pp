# == Class: ssh::install
#
# Installs the ssh client.
#
# === Parameters
#
# [*ssh_client_package*]
#   The name of the ssh client package that should be installed. eg openssh-clients
#
# [*ssh_server_package*]
#   The name of the ssh server package that should be installed. eg openssh-server
#
class ssh::install inherits ssh::params {
  package { $ssh::params::ssh_client_package:
    ensure => present,
  }

  package { $ssh::params::ssh_server_package:
    ensure => present,
  }
}

