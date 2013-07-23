class cloudmonitoring::token {
  include cloudmonitoring::raxmon

  # create a token if it doesn't already exist
  exec { "raxmon-agent-tokens-create":
    command     => "raxmon-agent-tokens-create --label=${::fqdn}",
    path        => ["/usr/local/bin", "/usr/bin/", "/bin"],
    environment => "RAXMON_RAXRC=${cloudmonitoring::raxmon::raxrc}",
    require     => Package["rackspace-monitoring-cli"],
    unless      => "raxmon-agent-tokens-list | grep ${::fqdn}",
  }

  # now that the token exists, write the token to a file
  $agent_token_filename = "/tmp/${::fqdn}.agent_token"
  exec { "raxmon-agent-tokens-list ${::fqdn}":
    command     => "raxmon-agent-tokens-list | grep ${::fqdn} | sed -n 's/.*id=\\([0-9a-f]*\\.[0-9]*\\).*/\\1/p' > ${agent_token_filename}",
    path        => ["/usr/local/bin", "/usr/bin/", "/bin"],
    environment => "RAXMON_RAXRC=${cloudmonitoring::raxmon::raxrc}",
    creates     => $agent_token_filename,
    require     => Exec["raxmon-agent-tokens-create"],
  }

  # with the token written to disk, create the
  # /etc/rackspace-monitoring-agent.cfg file
  $cfg_filename = "/etc/rackspace-monitoring-agent.cfg"
  exec { "create ${cfg_filename}":
    command => "echo -n 'monitoring_token ' > ${cfg_filename} && cat ${agent_token_filename} >> ${cfg_filename} && echo 'monitoring_id ${::fqdn}' >> ${cfg_filename}",
    path    => ["/usr/bin/", "/bin"],
    creates => $cfg_filename,
    require => Exec["raxmon-agent-tokens-list ${::fqdn}"],
    notify  => Class['cloudmonitoring::service'],
  }
  
}
