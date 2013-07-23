Install, configure, and launch the Rackspace Cloud Monitoring Agent

You can create a monitoring instance in one of two ways: either by
providing a
[service agent monitoring token](http://docs.rackspace.com/cm/api/v1.0/cm-devguide/content/service-agent-tokens.html#service-agent-token-create-token)
like this:

    class { 'cloudmonitoring':
      monitoring_token => 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff.000000'  
    }

...or by providing your username and
[API key](http://www.rackspace.com/knowledge_center/article/rackspace-cloud-essentials-1-generating-your-api-key)
to authenticate to Rackspace (via
[raxmon](https://github.com/racker/rackspace-monitoring-cli)) like
this:

    class { 'cloudmonitoring':
	  username => "myRackspaceUsername",
	  apikey   => "myApiKey",
    }
