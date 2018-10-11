# == Class: barbican::client
#
# Installs Barbican client.
#
# === Parameters
#
# [*ensure*]
#   (optional) Ensure state of the package.
#   Defaults to 'present'.
#
class barbican::client (
  $ensure              = 'present',
  $client_package_name = $::barbican::params::client_package_name,
) {

  include ::barbican::deps
  include ::barbican::params

  package { 'python-barbicanclient':
    ensure => $ensure,
    name   => $client_package_name,
    tag    => 'openstack',
  }

  include '::openstacklib::openstackclient'
}
