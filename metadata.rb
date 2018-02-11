name 'conntrack'
maintainer 'Rackspace'
maintainer_email 'sfo-devops@lists.rackspace.com'
license 'Apache 2.0'
description 'Installs/Configures conntrack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.2'

supports 'ubuntu'

recipe 'default', 'installs conntrack'

source_url 'https://github.com/mmi-cookbooks/conntrack-chef' if respond_to?(:source_url)
issues_url 'https://github.com/mmi-cookbooks/conntrack-chef' if respond_to?(:issues_url)
