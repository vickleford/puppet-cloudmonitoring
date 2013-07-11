class cloudmonitoring::repo {

  $package_url = "http://stable.packages.cloudmonitoring.rackspace.com"
  $signing_url = "https://monitoring.api.rackspacecloud.com/pki/agent"
  $signingkey = 'linux.asc'
  
  if $::osfamily == 'RedHat' {
    if $::os_maj_version < 6 { 
      $signingkey = $operatingsystem ? {
        'RedHat' => 'redhat-5.asc',
        'CentOS' => 'centos-5.asc',
      }
    }
        
    yumrepo { 'rackspace_monitoring':
      descr   => 'Rackspace Monitoring',
      baseurl => "${package_url}/${::os_lower}-${::os_maj_version}-${::architecture}",
      gpgkey  => "${signing_url}/${signingkey}",
      enabled => 1,
    }
  }

  if $::osfamily == 'Debian' {
    $release_name = $operatingsystem ? {
      "Debian" => $::lsbdistcodename,
      "Ubuntu" => $::operatingsystemrelease,
    }
    include apt
    apt::source { "rackspace_monitoring":
      location    => "${package_url}/${::os_lower}-${release_name}-${::hardwaremodel}",
      release     => "cloudmonitoring",
      include_src => false,
      key         => "D05AB914",
      key_source  => "${signing_url}/${signingkey}",
    }
  }
}
