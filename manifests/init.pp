# == Class: ssh
#
# Manages ssh(d).
#
class ssh {
  include ssh::install
  include ssh::service
}

