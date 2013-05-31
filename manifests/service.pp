class cloudmonitoring::service { 
  service { 'rackspace-monitoring-agent':
    ensure  => running,
    enable  => true,
    require => Class['cloudmonitoring::config'],
  }
}