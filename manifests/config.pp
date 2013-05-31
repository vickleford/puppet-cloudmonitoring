class cloudmonitoring::config {
  file { '/etc/rackspace-monitoring-agent.cfg':
    ensure  => file,
    content => template('cloudmonitoring/rackspace-monitoring-agent.cfg.erb'),
    notify  => Class['cloudmonitoring::service'],
    require => Class['cloudmonitoring::install'],
  }
}