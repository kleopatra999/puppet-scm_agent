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
  $version                        = '0.6.1'
  $download_url                   = "https://download.srcclr.com/scm"
  $pkg_name                       = 'srcclr-scm-agent'
  $service_ensure                 = 'running'

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
