# == Class: cloudmonitoring
#
# Install, configure, and launch the Rackspace Cloud Monitoring Agent
# Assumes you already have configured and know an agent token 
# See http://www.rackspace.com/knowledge_center/article/install-the-cloud-monitoring-agent#Setup
# 
# === Parameters
#
# [*monitoring_token*]
#   monitoring_token authenticates your agent to report back to the monitoring service
#   see http://docs.rackspace.com/cm/api/v1.0/cm-devguide/content/service-agent-tokens.html
#
# === Authors
# 
# Victor Watkins <vic.watkins@rackspace.com>
#


class cloudmonitoring($monitoring_token) {
  include cloudmonitoring::install, cloudmonitoring::config, cloudmonitoring::service
}