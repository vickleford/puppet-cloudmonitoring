class cloudmonitoring::install {
  include cloudmonitoring::repo
  
  package { 'rackspace-monitoring-agent':
    ensure  => installed,
    require => Class['cloudmonitoring::repo'],
  }
}