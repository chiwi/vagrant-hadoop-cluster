class sqoop {
 $sqoop_version = "1.4.3"
 $sqoop_home = "/opt/sqoop"

exec { "download_sqoop":
command => "wget -O /tmp/sqoop.tar.gz http://apache.dattatec.com/sqoop/${sqoop_version}/sqoop-${sqoop_version}.bin__hadoop-1.0.0.tar.gz",
path => $path,
unless => "ls /opt | grep sqoop_${sqoop_version}",
require => Package["openjdk-6-jdk"]
}

exec { "unpack_sqoop" :
  command => "tar -zxf /tmp/sqoop.tar.gz -C /opt",
  path => $path,
  creates => "${sqoop_home}-${sqoop_version}",
  require => Exec["download_sqoop"]
}

file {
  "${sqoop_home}-${sqoop_version}.bin__hadoop-1.0.0/lib/jtds-1.2.2.jar":
  source => "puppet:///modules/sqoop/jtds-1.2.2.jar",
  mode => 644,
  owner => root,
  group => root,
  require => Exec["unpack_sqoop"]
 }

}
