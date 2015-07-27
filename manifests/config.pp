class scm_agent::config (
  $manage_java,
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

  # This is the worst java implementation ever, waiting for something better to install java 8
  if $manage_java { 
    include ::apt
    apt::ppa { 'ppa:webupd8team/java': }
    package { 'oracle-java8-installer':
      ensure  => present,
      require => [Apt::Ppa['ppa:webupd8team/java'],Exec['fucking_contracts']],
    }
    exec { 'fucking_contracts':
      command => '/bin/echo oracle-java8-installer shared/accepted-oracle-licen  se-v1-1 select true | sudo /usr/bin/debconf-set-selections',
    }
    file_line { 'ubuntu_bashrc':
      path  => '/home/ubuntu/.bashrc',
      line  => 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle/'
    }
    file_line { 'root_bashrc':
      path  => '/root/.bashrc',
      line  => 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle/'
    }
  }
}
