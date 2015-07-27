class scm_agent::install (
  $install_dir            = $scm_agent::params::install_dir,
  $download_url           = $scm_agent::params::download_url,
  $version,
  $pkg_name               = $scm_agent::params::pkg_name,
)inherits scm_agent::params{

  File {
    owner => 'root',
    group => 'root',
  }

  file { $install_dir:
    ensure  => directory,
  }

  package {['wget','unzip']: ensure => present, }

  scm_agent::remote_file { "${install_dir}/scm_agent.zip":
    source    => "${download_url}/${pkg_name}-${version}.zip",
    require   => [Package['wget','unzip'],File[$install_dir]],
  }

  exec { 'unzip':
    command       => "/usr/bin/unzip ${install_dir}/scm_agent.zip",
    refreshonly   => true,
    creates       => "${install_dir}/srcclr-scm-agent-${version}",
  }
}
