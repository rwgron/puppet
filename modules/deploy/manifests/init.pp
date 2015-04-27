class deploy {

include jboss

package { 'install_unzip':
    name => 'unzip',
    ensure => installed,
}

package { 'install_wget':
   name => 'wget',
   ensure => installed,
}

$deploy_path = '/opt/jboss-as-7.1.1.Final/standalone/deployments'


exec { 'get_application':
  command => "/usr/bin/wget http://www.cumulogic.com/download/Apps/testweb.zip -O /tmp/testweb.zip",
  creates => "/tmp/testweb.zip",
}

file { 'got_application':
  mode => 0755,
  path => "/tmp/testweb.zip",
  require => Exec["get_application"],
  replace => "true",
}

exec {"temp_folder":
  command => "/bin/mkdir -p /tmp/tmp_testweb",
  creates => "/tmp/tmp_testweb",
}

exec {
  "apps_unzip_testweb":
  cwd => "/tmp/tmp_testweb",
  command => "/usr/bin/unzip /tmp/testweb.zip ",
  creates => "/tmp/tmp_testweb/testweb/testweb.war",
  require => [Exec["temp_folder"],File['got_application']],
}

file { "deploy_war":
  source =>"/tmp/tmp_testweb/testweb/testweb.war",
  mode => 0755,
  path => "$deploy_path/testweb.war",
  replace => true,
  require => Exec["apps_unzip_testweb"],
}

file { "deploy_xml":
  source => "puppet:///modules/deploy/testweb.xml",
  mode => 0755,
  path => "$deploy_path/testweb.xml",
  replace => true,
  require => File["deploy_war"],
  notify => Service['jboss'],
}

exec {"delete_old_tmp_testweb":
  command => "/bin/rm -rf /tmp/tmp_testweb",
  require => File ["deploy_xml"],
}

exec {"delete_old_testweb.zip":
  command => "/bin/rm -rf /tmp/testweb.zip",
  require => File ["deploy_xml"],
 }
}




