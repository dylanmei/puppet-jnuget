class jnuget::params {
  $version        = '0.7.3'
  $user           = 'jnuget'
  $nuget_dir      = "/home/$user/.nuget"
  $webapp_dir     = "/opt/jnuget/webapps"
  $package_dir    = "$nuget_dir/Packages"
  $source_name    = undef
  $admin_user     = $user
  $admin_pass     = $user
  $admin_api_key  = 'AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA'
}
