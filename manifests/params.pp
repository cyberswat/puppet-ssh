# == Class: ssh::params
#
# Declares and sets the parameters necessary for the ssh module.
#
# === Parameters
#
# [*ssh_client_package*]
#   The ssh client package name. eg openssh-clients
#
# [*ssh_server_package*]
#   The sshe server package name. eg openssh-server
#
# [*ssh_server_config*]
#   The path to the ssh server configuration file. eg /etc/ssh/sshd_config
#
# [*ssh_server_service*]
#   The ssh server service name. eg sshd
#
class ssh::params {
  case $operatingsystem {
    /(Ubuntu|Debian|RedHat|CentOS|Fedora)/: {
      $ssh_client_package = 'openssh-clients'     
      $ssh_server_package = 'openssh-server'     
      $ssh_server_config = '/etc/ssh/sshd_config'
      $ssh_server_service = 'sshd'
    }
  }
}

