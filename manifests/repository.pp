# == Class: scala::repository
#
# Install the Typesafe apt repository
#
class scala::repository{
  include ::apt
  include ::apt::update
  include ::wget

  anchor { 'scala::repository::begin': } ->

  wget::fetch { 'download-typesafe-repo':
    source      => 'http://apt.typesafe.com/repo-deb-build-0002.deb',
    destination => '/usr/local/src/typesafe-repo.deb',
  } ->

  package { 'typesafe-repo':
    ensure   => installed,
    source   => '/usr/local/src/typesafe-repo.deb',
    provider => 'dpkg',
    notify   => Class['::apt::update'],
  } ->

  anchor { 'scala::repository::end': }
}
