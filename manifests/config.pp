class scm_agent::config (
  $agent_id,
  $agent_secret,
  $scm_url,                
  $scm_type,  
  $install_dir     = $scm_agent::params::install_dir,
  $auth_token,
  $scm_username, 
  $scm_password,
  $proxy_host,
  $proxy_port,

)inherits scm_agent::params{

  file { '/var/log':
    ensure => directory,
  }

  file { 'application_properties':
    ensure    => file,
    path      => "${install_dir}/application.properties",
    content   => template('scm_agent/application.properties.erb'),
  }

}
