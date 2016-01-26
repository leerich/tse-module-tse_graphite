# Example profile class for deploying dwerder/graphite
# testing using version 5.16.0 on RHEL 6
class tse_graphite {
  contain epel

  exec {'disable selinux':
    command => '/usr/sbin/setenforce 0',
    unless => '/usr/sbin/getenforce | /bin/grep Permissive',
  }

  file {'/usr/bin/pip-python':
    ensure => 'link',
    target => '/usr/bin/pip',
  }

  class { 'graphite':
    require => [
      Class['epel'],
      File['/usr/bin/pip-python'],
      Exec['disable selinux']
    ],
  }
}
