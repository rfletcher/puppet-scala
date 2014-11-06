# == Class: scala::lang
#
# Install scala from the Typesafe repository
#
class scala::lang {
  include ::scala::repository

  package { 'scala':
    require => Class['::scala::repository'],
  }
}
