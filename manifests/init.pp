class scm_agent (
  $agent_id,
  $agent_secret,
  $scm_url                = undef,
  $scm_type               = $scm_agent::params::agent_type,
  $version                = $scm_agent::params::version,
  $use_docker             = $scm_agent::params::use_docker,
  $docker_registry_url    = $scm_agent::params::docker_registry_url,
  $docker_env             = $scm_agent::params::docker_env,
  $install_dir            = $scm_agent::params::install_dir,
  $download_url           = $scm_agent::params::download_url,
  $docker_env             = $scm_agent::params::docker_env,
)inherits scm_agent::params{

  validate_re($scm_type, '^GITHUB$|^GITHUBENTERPRISE$|^STASH$', "You must pass GITHUB || GITHUBENTERPRISE || STASH to $scm_type")

  class {::scm_agent::install: version => $version }
  #->
  #class {::scm_agent::config:}
  #->
  #class {::scm_agent::service:}

}
