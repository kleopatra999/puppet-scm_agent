class scm_agent::install (
  $install_dir            = $scm_agent::params::install_dir,
  $download_url           = $scm_agent::params::download_url,
  $version,
)inherits scm_agent::params{

  File {
    Owner => 'root',
    Group => 'root',
  }

  file { $install_dir:
    ensure  => directory,
  }

  package {'wget': ensure => present, }

  scm_agent::remote_file { "${install_dir}/scm_agent":
    source    => $download_url,
    require   => [Package['wget'],File[$install_dir]],
  }
}
