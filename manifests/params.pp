class jnuget::params {
  $version        = '0.7.3'
  $user           = 'jnuget'
  $source         = 'DefaultSource'
  $nuget_dir      = "/home/$user/.nuget"
  $webapp_dir     = "/opt/jnuget/webapps"
  $source_dir     = "$nuget_dir/Packages"
  $admin_user     = $user
  $admin_pass     = $user
  $admin_api_key  = 'AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA'
}
