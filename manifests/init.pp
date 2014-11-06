# == Class: scala
#
# Install scala from the Typesafe repository
#
class scala {
  validate_re($::osfamily, '^Debian$', "This module relies on a deb package \
and only works on Debian based distros")

  include ::scala::repository

  package { [
    'typesafe-stack',
    'scala',
  ]:
    ensure  => installed,
    require => Class['::scala::repository'],
  }
}
