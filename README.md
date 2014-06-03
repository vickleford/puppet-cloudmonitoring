Puppet Cloud Monitoring
=======================

A Puppet module to install, configure, and launch the [Rackspace Cloud Monitoring Agent]
(http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent)
to enable
[Rackspace monitoring](http://www.rackspace.com/cloud/monitoring/).

For Debian/Ubuntu, this module depends on
[puppetlabs-apt](https://github.com/puppetlabs/puppetlabs-apt).


Usage
-----

You can create a monitoring instance in one of two ways:

### Providing a [service agent monitoring token](http://docs.rackspace.com/cm/api/v1.0/cm-devguide/content/service-agent-tokens.html#service-agent-token-create-token)

    class { 'cloudmonitoring':
      monitoring_token => 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff.000000'  
    }

### Providing your username and [API key](http://www.rackspace.com/knowledge_center/article/rackspace-cloud-essentials-1-generating-your-api-key) to authenticate to Rackspace (via [raxmon](https://github.com/racker/rackspace-monitoring-cli))

    class { 'cloudmonitoring':
	  username => "myRackspaceUsername",
	  apikey   => "myApiKey",
    }


**Note:** If you choose this method, [raxmon](https://github.com/racker/rackspace-monitoring-cli) will be installed using Pip, and all of the nodes you wish to monitor will need to be labelled in the Rackspace dashboard with a label that matches their FQDN, otherwise, tokens will not be mapped correctly and your catalog runs will fail.
