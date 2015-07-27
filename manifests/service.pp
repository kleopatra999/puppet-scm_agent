class scm_agent::service (
  $service_ensure       = $scm_agent::params::service_ensure,
  $service              = $scm_agent::params::service_name,
)inherits scm_agent::params{

  file {'/etc/init.d/scm_agent':
    ensure    => file,
    mode      => '0755',
    content   => template('scm_agent/init.erb'),
    notify    => Service['scm_agent'],
  }

  service {'scm_agent':
    ensure    => $service_ensure,
    enable    => true,
}
