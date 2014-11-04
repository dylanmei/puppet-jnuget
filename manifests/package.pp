
class jnuget::package (
  $version = undef
) {
  require wget

  if $version == undef {
    fail("'version' is a required parameter")
  }

  wget::fetch { "jnuget-$version":
    source        => "https://bitbucket.org/aristar/jnuget/downloads/jnuget-$version.war",
    destination   => "/usr/local/src/jnuget-$version.war",
  }
}
