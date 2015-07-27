define scm_agent::remote_file ( 
    
    $source  = undef,
    $mode    = '0644',
){
    exec { "wget_${source}":
        command     => "/usr/bin/wget -q ${source} -O ${name}",
        creates     => $name,
    }

    file { $name:
        mode    => $mode,
        require => Exec["wget_${source}"]
    }
}
