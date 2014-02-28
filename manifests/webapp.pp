# Class: jnuget::webapp
#
#
class jnuget::webapp(
  $user           = $jnuget::params::user,
  $source         = $jnuget::params::source,
  $version        = $jnuget::params::version,
  $webapp_dir     = $jnuget::params::webapp_dir,
  $nuget_dir      = $jnuget::params::nuget_dir,
  $source_dir     = $jnuget::params::source_dir,
  $admin_user     = $jnuget::params::admin_user,
  $admin_pass     = $jnuget::params::admin_pass,
  $admin_api_key  = $jnuget::params::admin_api_key,
  $war_context    = 'jnuget'
) inherits jnuget::params {

  # create config / package directory
  # jnuget defaults to .nuget dir in user home

  file { $nuget_dir:
    ensure  => directory,
    owner   => $user,
    require => User[$user],
  } ->
  file { "${nuget_dir}/jnuget.users.xml":
    content => template("jnuget/jnuget.users.xml.erb"),
  } ->
  file { "${nuget_dir}/jnuget.config.xml":
    content => template("jnuget/jnuget.config.xml.erb"),
  } ->
  file { $source_dir:
    ensure  => directory,
    owner   => $user,
  }

  class { 'jnuget::package':
    version => $version,
  } ->
  file { "${webapp_dir}/${war_context}.war":
    source  => "/usr/local/src/jnuget-${version}.war",
    owner   => $user,
    group   => $user,
  }
}