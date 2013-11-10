
define jnuget::webapp(
  $version        = $jnuget::params::version,
  $webapp_dir     = $jnuget::params::webapp_dir,
) {

  require wget

  wget::fetch { "jnuget-$version":
    source        => "http://jnuget.googlecode.com/files/jnuget-$version.war",
    destination   => "/usr/local/src/jnuget-$version.war",
  } ->
  file { "$webapp_dir/ROOT.war":
    source  => "/usr/local/src/jnuget-$version.war",
    owner   => $user,
  }
}