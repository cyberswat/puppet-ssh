# == Class: ssh::parmas
#
# Declares and sets the parameters necessary for the ssh module.
#
# === Parameters
#
# [*sshd_config*]
#   The path to the sshd configuration file. eg /etc/ssh/sshd_config
#
# [*ssh_authorized_keys*]
#   The path to the authorized keys file. eg /root/.ssh/authorized_keys2
#
class ssh::params {
  case $operatingsystem {
    /(Ubuntu|Debian|RedHat|CentOS|Fedora)/: {
      $ssh_client_package = 'openssh-clients'     
      $ssh_server_package = 'openssh-server'     
      $ssh_server_config = '/etc/ssh/sshd_config'
      $ssh_server_service = 'sshd'
      $ssh_authorized_keys = '/root/.ssh/authorized_keys2'
    }
  }
}

