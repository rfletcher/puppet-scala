# == Class: scala::sbt
#
# Install scala SBT from the Typesafe repository
#
class scala::sbt {
  include ::scala::repository

  package { 'sbt':
    require => Class['::scala::repository'],
  }
}
