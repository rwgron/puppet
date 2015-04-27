node 'node2.minsk.epam.com'{

class { 'jboss':
      install => 'source',
      version => '7',
}
include 'java'
include 'jboss'
include 'deploy'

}


