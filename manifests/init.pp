# = Class: jnuget
#
# Module to manage jnuget
#
# == Requirements:
#
# - This module makes use of webget in the puppi module
#   (https://github.com/maestrodev/puppet-wget)
#


class jnuget (
    $version      = params_lookup('version'),
    $jnuget_user  = params_lookup('jnuget_user'),
    $nuget_home   = params_lookup('nuget_home'),
  ) inherits jnuget::params {

    # package { 'jnuget':
    #     ensure => $ensure
    # }

    notify { 'hello world': }
}

