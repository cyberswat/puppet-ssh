# == Class: ssh::config
#
# Manages variables for both puppet client and puppet master.
#
# === Variables
#
# [*puppetmaster*]
#   The fully qualified name of the puppet master.  In the case of a
#   puppet client the name will be the clients master otherwise it is
#   the masters name.  Used in puppet/etc_puppet_conf.erb.
#
# === Examples
#
#  class { 'ssh::config' :
#    conf => {
#      'port' => 22
#    }
#  }
#
#
class ssh::config(
  $port = 22,
  $rsa_authentication = 'yes',
  $pub_key_authentication = 'yes',
  $authorized_keys_file = '.ssh/authorized_keys',
  $authorized_keys = {}
) inherits ssh::params {

  file { $ssh::params::ssh_server_config:
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template("ssh/sshd_conf.erb"),
    require => Class["ssh::install"],
    notify => Class["ssh::service"],
  }

  file { "/root/.ssh":
    ensure => "directory",
    mode    => 700,
    owner   => root,
    group   => root,
  }

  file { $ssh::params::ssh_authorized_keys:
    ensure  => present,
    mode    => 600,
    owner   => root,
    group   => root,
    content => template("ssh/ssh_authorized_keys.erb"),
  }

}

