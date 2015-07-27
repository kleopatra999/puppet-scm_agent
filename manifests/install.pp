class scm_agent::install (
  $install_dir            = $scm_agent::params::install_dir,
  $download_url           = $scm_agent::params::download_url,
  $version,
  $pkg_name               = $scm_agent::params::pkg_name,
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
    source    => "${download_url}/${pkg_name}-${version}.zip",
    require   => [Package['wget'],File[$install_dir]],
  }
}
