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
    $user           = $jnuget::params::user,
    $nuget_dir      = $jnuget::params::nuget_dir,
    $package_dir    = $jnuget::params::package_dir,
    $admin_user     = $jnuget::params::admin_user,
    $admin_pass     = $jnuget::params::admin_pass,
    $admin_api_key  = $jnuget::params::admin_api_key,  
    $source_name    = $jnuget::params::source_name
  ) inherits jnuget::params {

  if $source_name == undef {
    fail("'source_name' is a required parameter")
  }

  # create config / package directory
  # jnuget defaults to .nuget dir in user home

  file { $nuget_dir:
    ensure  => directory,
    owner   => $user,
    require => User[$user],
  } ->
  file { "$nuget_dir/jnuget.users.xml":
    content => template("jnuget/jnuget.users.xml.erb"),
  } ->
  file { "$nuget_dir/jnuget.config.xml":
    content => template("jnuget/jnuget.config.xml.erb"),
  }
  file { "$nuget_dir/Packages":
    ensure  => directory,
    owner   => $user,
  }
}

