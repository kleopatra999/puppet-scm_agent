class scm_agent (
  $agent_id,
  $agent_secret,
  $scm_url                = undef,
  $scm_type               = $scm_agent::params::scm_type,
  $auth_token             = $scm_agent::params::auth_token,
  $scm_username           = $scm_agent::params::scm_username,
  $scm_password           = $scm_agent::params::scm_password,
  $proxy_host             = $scm_agent::params::proxy_host,
  $proxy_port             = $scm_agent::params::proxy_port,
  $version                = $scm_agent::params::version,
  $use_docker             = $scm_agent::params::use_docker,
  $docker_registry_url    = $scm_agent::params::docker_registry_url,
  $docker_env             = $scm_agent::params::docker_env,
  $install_dir            = $scm_agent::params::install_dir,
  $download_url           = $scm_agent::params::download_url,
  $docker_env             = $scm_agent::params::docker_env,
  $manage_java            = $scm_agent::params::manage_java,
  $m2_home                = undef, 
)inherits scm_agent::params{

  notify { "MAVEN HOME: ${m2_home}":}

  validate_re($scm_type, '^GITHUB$|^GITHUBENTERPRISE$|^STASH$', "You must pass GITHUB || GITHUBENTERPRISE || STASH to $scm_type")

  class {::scm_agent::install: version => $version }
  ->
  class {::scm_agent::config:
    manage_java   => $manage_java,
    scm_url       => $scm_url,
    scm_type      => $scm_type,
    agent_id      => $agent_id,
    agent_secret  => $agent_secret,
    install_dir   => $install_dir,
    auth_token    => $auth_token,
    scm_username  => $scm_username,
    scm_password  => $scm_password,
    proxy_host    => $proxy_host,
    proxy_port    => $proxy_port,
    m2_home       => $m2_home,
  }
  ->
  class {::scm_agent::service: version => $version }
}
