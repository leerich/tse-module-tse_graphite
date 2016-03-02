# Example profile class for deploying dwerder/graphite
# testing using version 5.16.0 on RHEL 6
class tse_graphite {
  contain epel

 
  }

  file {'/usr/bin/pip-python':
    ensure => 'link',
    target => '/usr/bin/pip',
  }

  class { 'graphite':
    gr_timezone => 'America/Toronto',
    require     => [
      Class['epel'],
      File['/usr/bin/pip-python'],
    
    ],
  }
}
