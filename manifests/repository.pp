# == Class: scala::repository
#
# Install the Typesafe apt repository
#
class scala::repository{
  include ::wget

  wget::fetch { 'download-typesafe-repo':
    source      => 'http://apt.typesafe.com/repo-deb-build-0002.deb',
    destination => '/usr/local/src/repo-deb-build-0002.deb',
    before      => Package['typesafe-repo'],
  }

  package { 'typesafe-repo':
    ensure   => installed,
    provider => 'dpkg',
    source   => '/usr/local/src/repo-deb-build-0002.deb',
    notify   => Exec['apt-update-typesafe'],
  }

  exec { 'apt-update-typesafe':
    command     => '/usr/bin/apt-get update',
    refreshonly => true,
  }
}
