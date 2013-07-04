include hadoop
include sqoop

group { "puppet":
  ensure => "present",
}
exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
}

package { "openjdk-6-jdk" :
   ensure => present,
  require => Exec['apt-get update']
}

file { "/root/.ssh":
  ensure => "directory",
  require => Exec['apt-get update']
}

file {
  "/root/.ssh/id_rsa":
  source => "puppet:///modules/hadoop/id_rsa",
  mode => 600,
  owner => root,
  group => root,
  require => Exec['apt-get update']
 }

file {
  "/root/.ssh/id_rsa.pub":
  source => "puppet:///modules/hadoop/id_rsa.pub",
  mode => 644,
  owner => root,
  group => root,
  require => Exec['apt-get update']
 }

ssh_authorized_key { "ssh_key":
    ensure => "present",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCg2iAC+Bx7TMHMxla2LlZ5YDbOXU6oNYVBh3DOXond7nVxsT/8KJ+6z22Q06zUodxFIko3kP97eFilESnpbtcpbiOXCyvVZ5l2pg2qwVX+cKm02uWin+wkhyjZoJoNQQsGvB85bjoRDjJbWT5pt1et6CVxPcCONUoQi7zG1VSiDPWnb/z0/FrIAVchFoQAD6y1tIumDh23uTnQiV1EcRbVtNUZwdh98ny/Kbjf0QrtxmU1gQG1CFBBuJUxe5shIYL0NgonZidbqCbdAqIk2G1aU/16vGhLLw24EIAq2AatdkXN6VPRUplHbH+qj77T6ZJDnkt49oCQ1+9Ch0SQNA+p",
    type   => "ssh-rsa",
    user   => "root",
    require => File['/root/.ssh/id_rsa.pub']
}

host { 'master':
    ip => '10.155.8.100',
}
host { 'hadoop1':
    ip => '10.155.8.101',
}
host { 'hadoop2':
    ip => '10.155.8.102',
}
host { 'hadoop3':
    ip => '10.155.8.103',
}
host { 'hadoop4':
    ip => '10.155.8.104',
}
host { 'hadoop5':
    ip => '10.155.8.105',
}

