 node 'puppet.minsk.epam.com' {
       include '::mysql::server'


 mysql::db { 'test_mdb':
 user => 'test_user',
 password => 'testpass',
 host => 'localhost',
 grant => ['ALL'],
  }
}

