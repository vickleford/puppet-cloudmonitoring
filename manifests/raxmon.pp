class cloudmonitoring::raxmon (
  $raxrc = "/etc/raxrc",
) {

  # setup raxmon
  file { $raxrc:
    content => template("cloudmonitoring/raxrc.erb"),
  }
  
  if ! defined( Package["rackspace-monitoring-cli"] ) {
    package { "rackspace-monitoring-cli":
      ensure   => installed,
      require  => File[$raxrc],
      provider => pip,
    }
  }
  
}
