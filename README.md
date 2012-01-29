Class: ssh
=
Manages ssh(d).

Class: ssh::config
=
Manages ssh(d). The default configuration disables password based
authentication by requiring ssh keys to authenticate against port 22. Changing
to a non-standard port and using key based authentication as illustrated in
the example is suggested.

Variables
-
 * [*port*]
   The port you would like to connet ssh through.
   Default: 22
   Optional: yes

 * [*rsa_authentication*]
   The value to set for RSAAuthentication in sshd configuration.
   Default: 'yes'
   Optional: yes

 * [*pub_key_authentication*]
   The value to set for PubkeyAuthentication on sshd configuration.
   Default: 'yes'
   Optional: yes

 * [*authorized_keys_file*]
   The name that should be used for the authorized keys file.
   Default: 'authorized_keys2'
   Optional: yes

 * [*authorized_keys_parent*]
   The parent directory of the authorized keys file. Should not end in /
   Default: '/root/.ssh'
   Optional: yes

 * [*authorized_keys*]
   An array of authorized keys to add to the authorized keys file.
   Default: []
   Optional: no

Examples
-
   class { 'ssh::config' :
      port => '1234',
      rsa_authentication => 'yes',
      pub_key_authentication => 'yes',
      authorized_keys_file => 'authorized_keys2',
      authorized_keys_parent => '/root/.ssh',
      authorized_keys => [$key1, $key2, $key3],
   }

Class: ssh::params
=
Declares and sets the parameters necessary for the ssh module.

Parameters
-


 * [*ssh_client_package*]
   The ssh client package name. eg openssh-clients

 * [*ssh_server_package*]
   The sshe server package name. eg openssh-server

 * [*ssh_server_config*]
   The path to the ssh server configuration file. eg /etc/ssh/sshd_config

 * [*ssh_server_service*]
   The ssh server service name. eg sshd

Class: ssh::service
=
Manages the ssh server service.

Parameters
-

 * [*ssh_server_service*]
   The name of the registered ssh server service.

