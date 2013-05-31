class cloudmonitoring::repo {
  if $::osfamily == 'RedHat' {
    if $::os_maj_version >= 6 {
      $signingkey = 'linux.asc'
    } else { 
      $signingkey = $operatingsystem ? {
        'RedHat' => 'redhat-5.asc',
        'CentOS' => 'centos-5.asc',
      }
    }
        
    yumrepo { 'rackspace_monitoring':
      descr   => 'Rackspace Monitoring',
      baseurl => "http://stable.packages.cloudmonitoring.rackspace.com/${::os_lower}-${::os_maj_version}-${::architecture}",
      gpgkey  => "https://monitoring.api.rackspacecloud.com/pki/agent/${signingkey}",
      enabled => 1,
    }
  }
}