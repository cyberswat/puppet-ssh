# == Class: ssh::config
#
# Manages ssh(d).  The default configuration disables password based
# authentication by requiring ssh keys to authenticate against port 22. Changing
# to a non-standard port and using key based authentication as illustrated in
# the example is suggested.
#
# === Variables
#
# [*port*]
#   The port you would like to connet ssh through.
#   Default: 22
#   Optional: yes
#
# [*rsa_authentication*]
#   The value to set for RSAAuthentication in sshd configuration.
#   Default: 'yes'
#   Optional: yes
#
# [*pub_key_authentication*]
#   The value to set for PubkeyAuthentication on sshd configuration.
#   Default: 'yes'
#   Optional: yes
#
# [*authorized_keys_file*]
#   The name that should be used for the authorized keys file.
#   Default: 'authorized_keys2'
#   Optional: yes
#
# [*authorized_keys_parent*]
#   The parent directory of the authorized keys file.  Should not end in /
#   Default: '/root/.ssh'
#   Optional: yes
#
# [*authorized_keys*]
#   An array of authorized keys to add to the authorized keys file.
#   Default: []
#   Optional: no
#
# === Examples
#
#  class { 'ssh::config' :
#    port => '1234',
#    rsa_authentication => 'yes',
#    pub_key_authentication => 'yes',
#    authorized_keys_file => 'authorized_keys2',
#    authorized_keys_parent => '/root/.ssh',
#    authorized_keys => [$key1, $key2, $key3],
#  }
#

class ssh::config(
  $port = 22,
  $rsa_authentication = 'yes',
  $pub_key_authentication = 'yes',
  $authorized_keys_file = 'authorized_keys2',
  $authorized_keys_parent = '/root/.ssh',
  $authorized_keys = [],
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

  file { $authorized_keys_parent:
    ensure => "directory",
    mode    => 700,
    owner   => root,
    group   => root,
  }

  file { "${authorized_keys_parent}/${authorized_keys_file}":
    ensure  => present,
    mode    => 600,
    owner   => root,
    group   => root,
    content => template("ssh/ssh_authorized_keys.erb"),
  }

}

