Install, configure, and launch the [Rackspace Cloud Monitoring Agent]
(http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent)
to enable
[Rackspace monitoring](http://www.rackspace.com/cloud/monitoring/).

For Debian/Ubuntu, this module depends on
[puppetlabs-apt](https://github.com/puppetlabs/puppetlabs-apt).

Assumes you already have a monitoring token to supply it

Examples:

    class { 'cloudmonitoring':
      monitoring_token => 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff.000000'  
    }
