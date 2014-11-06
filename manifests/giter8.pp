# == Class: scala::giter8
#
# Install Giter8 from the Typesafe repository
#
class scala::giter8 {
  include ::scala::repository

  package { 'g8':
    ensure  => present,
    require => Class['::scala::repository'],
  }
}
