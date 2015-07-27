class scm_agent::params {
  # Class basics
  $service_name                   = 'scm_agent'
  $image_name                     = $service_name 
  $agent_id                       = undef
  $agent_secret                   = undef
  $scm_url                        = undef
  $scm_type                       = 'GITHUB' 

  # ! docker settings
  $install_dir                    = '/opt/sourceclear'
  $xmx_settings                   = undef
  $xms_settings                   = undef
  $version                        = 'latest'
  $download_url                   = "https://download.srcclr.com/scm"
  $pkg_name                       = 'srcclr-scm-agent'
  $init_script                    = 'puppet:///modules/scm_agent/init'
  $init_path                      = '' 

  # Docker configuration 
  $docker_registry_url            = undef
  $docker_env                     = [
    "AGENTID=${agent_id}",
    "AGENTSECRET=${agent_secret}",
    "SCMURL=${scm_url}",
    "SCMTYPE=${scm_type}",
  ]
  $use_docker                     = false

}
