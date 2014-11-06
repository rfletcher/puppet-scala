# == Class: scala::lang
#
# Install scala from the Typesafe repository
#
class scala::lang {
  include ::scala::repository

  package { 'scala':
    ensure  => present,
    require => Class['::scala::repository'],
  }
}
